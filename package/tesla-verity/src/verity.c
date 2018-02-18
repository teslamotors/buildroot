#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#include <linux/fs.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <openssl/sha.h>

#include "log.h"
#include "squashfs_sb.h"
#include "verity.h"

#define MAX_METADATA_SIZE 4096

#define METADATA_VERSION      0
#define METADATA_MAGIC_NUMBER 0xba01ba01

#define MAX_HASH_ALGO_LEN 16
#define MAX_HASH_DATA_LEN 128

#define PUBKEY_PROD_PATH "/etc/verity-prod.pub"
#define PUBKEY_DEV_PATH "/etc/verity-dev.pub"

#define xstr(s) str(s)
#define str(s) #s

#define DMSETUP_PATH "/usr/sbin/dmsetup"

#define SECTOR_SIZE 512

struct verity_metadata {
        uint32_t magic;
        uint32_t version;
        uint8_t signature[256];
        uint32_t table_len;
        char table[0];
};

struct verity_table {
        unsigned int version;
        unsigned int data_block_size;
        unsigned int hash_block_size;
        uint64_t data_blocks;
        uint64_t hash_start_block;
        char hash_algorithm[MAX_HASH_ALGO_LEN + 1];
        char root_hash[MAX_HASH_DATA_LEN + 1];
        char salt[MAX_HASH_DATA_LEN + 1];
};

static int get_squashfs_size(int fd, uint64_t *squashfs_size)
{
        struct squashfs_super_block sb;

        if (read(fd, &sb, sizeof(sb)) != sizeof(sb)) {
                error("failed to read squashfs super block");
                return -1;
        }

        if (sb.bytes_used > UINT64_MAX - 4096) {
                error("invalid squashfs super block bytes_used 0x%" PRIx64, sb.bytes_used);
                return -1;
        }

        *squashfs_size = sb.bytes_used + (4096 - (sb.bytes_used & (4096 - 1)));

        return 0;
}

#ifdef AP_HW2

static int is_fused(void)
{
        int ret = 1;
        int fd;
        ssize_t count;
        char fuse[128];

        fd = open("/sys/devices/3820000.efuse/boot_sec_info", O_RDONLY | O_NONBLOCK);
        if (fd == -1) {
                error("failed to open boot_sec_info sysfs file");
                return 1;
        }

        count = read(fd, fuse, sizeof(fuse) - 1);
        if (count < 0) {
                error("failed to read boot_sec_info fuse");
                goto out;
        }

        fuse[count] = '\0';

        ret = !!strcmp(fuse, "0x00000000\n");
out:
        close(fd);
        return ret;
}

#elif defined ICE_MRB

#include "heci.h"

static int eom_query(uint8_t *eom)
{
        int ret = -1;
        struct heci_context ctx;

        if (heci_open(HECI_MKHI_CLIENT, &ctx)) {
                error("failed to open heci client\n");
                return -1;
        }

        if (heci_mca_eom(&ctx, eom)) {
                error("failed to read EoM value\n");
                goto out;
        }

        ret = 0;

out:
        heci_close(&ctx);
        return ret;
}

#define RETRY_COUNT 10
static int is_fused(void)
{
        uint8_t eom;
        int i;

        /* There are known Intel issues that cause EOM query to sporadically fail.
         * We account for this with a simple retry mechanism. */
        for (i = 0; i < RETRY_COUNT; i++) {
                if (eom_query(&eom) != -1)
                        break;
        }

        if (i == RETRY_COUNT) {
                error("failed to query eom bit");
                return 1;
        }

        return eom != 0;
}

#else
#error No target specified
#endif

static int rsa_verify(const unsigned char *data, size_t data_len,
                      const unsigned char *sig, size_t sig_len,
                      const char *pubkey_path)
{
        int ret = -1;
        FILE *f;
        RSA *pubkey = NULL;
        unsigned char hash[SHA256_DIGEST_LENGTH];

        f = fopen(pubkey_path, "r");
        if (!f) {
                error("failed to open public key '%s'", pubkey_path);
                return -1;
        }

        pubkey = PEM_read_RSA_PUBKEY(f, NULL, NULL, NULL);
        if (!pubkey) {
                error("failed to parse public key '%s'", pubkey_path);
                goto out;
        }

        SHA256(data, data_len, hash);

        if (RSA_verify(NID_sha256, hash, sizeof(hash), sig, sig_len, pubkey) == 1)
                ret = 0;

out:
        if (pubkey)
                RSA_free(pubkey);
        fclose(f);
        return ret;
}

static int verify_verity_table(struct verity_metadata *metadata, int dev_ok)
{
        if (rsa_verify((const unsigned char *)metadata->table, metadata->table_len,
                       metadata->signature, sizeof(metadata->signature),
                       PUBKEY_PROD_PATH) == 0) {
                info("verity table verified with production key");
                return 0;
        }

        if (dev_ok) {
                if (rsa_verify((const unsigned char *)metadata->table, metadata->table_len,
                               metadata->signature, sizeof(metadata->signature),
                               PUBKEY_DEV_PATH) == 0) {
                        info("verity table verified with development key");
                        return 0;
                }
        }

        return -1;
}

static int valid_verity_metadata(struct verity_metadata *metadata, size_t buf_size)
{
        int fused;

        if (metadata->magic != METADATA_MAGIC_NUMBER) {
                error("invalid metadata magic: 0x%" PRIx32, metadata->magic);
                return 0;
        }

        if (metadata->version != METADATA_VERSION) {
                error("unknown metadata version: %" PRIu32, metadata->version);
                return 0;
        }

        if (metadata->table_len >= buf_size - sizeof(*metadata)) {
                error("invalid metadata table length: 0x%" PRIx32, metadata->table_len);
                return 0;
        }

        fused = is_fused();
        if (!fused)
                info("component is unfused");

        if (verify_verity_table(metadata, !fused)) {
                error("invalid verity table signature");
                return 0;
        }

        // Ensure that the table is NULL terminated
        metadata->table[metadata->table_len] = '\0';

        return 1;
}

/*
 * Tesla verity-enable squashfs disk layout (not to scale).
 *
 *                    0  ------------------------------
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |          SquashFS          |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       |                            |
 *                       *                            *
 *                       *                            *
 *                       *                            *
 *        squashfs_size  ------------------------------
 *                       |                            |
 *                       |       Verity Metadata      |
 *                       |                            |
 * squashfs_size + 4096  ------------------------------
 *                       |                            |
 *                       |                            |
 *                       |      Verity Hash Tree      |
 *                       |                            |
 *                       |                            |
 *                       *                            *
 *                       *                            *
 *                       *                            *
 *          blkdev_size  ------------------------------
 *
 */
static int parse_verity_table(const char *blkdev, struct verity_table *table)
{
        int ret = -1;
        int fd;
        uint64_t blkdev_size;
        uint64_t squashfs_size = 0;
        struct verity_metadata *metadata;
        unsigned char buf[MAX_METADATA_SIZE];

        if (sizeof(*metadata) > sizeof(buf)) {
                error("metadata size 0x%zx larger than buffer size 0x%zx", sizeof(*metadata), sizeof(buf));
                return -1;
        }

        memset(table, 0, sizeof(*table));

        fd = open(blkdev, O_RDONLY | O_NONBLOCK);
        if (fd == -1) {
                error("failed to open '%s'", blkdev);
                return -1;
        }

        if (ioctl(fd, BLKGETSIZE64, &blkdev_size) < 0) {
                error("failed to get '%s' block device size", blkdev);
                goto done;
        }

        if (get_squashfs_size(fd, &squashfs_size)) {
                error("failed to get '%s' squashfs size", blkdev);
                goto done;
        }

        if (squashfs_size > blkdev_size) {
                error("squashfs size greater than block device size");
                goto done;
        }

        if (squashfs_size > UINT64_MAX - sizeof(buf)) {
                error("invalid squashfs size");
                goto done;
        }

        if (squashfs_size + sizeof(buf) > blkdev_size) {
                error("block device too small to contain verity metadata block");
                goto done;
        }

        if (pread(fd, buf, sizeof(buf), squashfs_size) != sizeof(buf)) {
                error("failed to read verity metadata block");
                goto done;
        }

        metadata = (struct verity_metadata *)buf;

        if (!valid_verity_metadata(metadata, sizeof(buf))) {
                error("invalid verity table metadata");
                goto done;
        }

        info("metadata table: %s", metadata->table);

        if (sscanf(metadata->table,
                   "%u %u %u %" PRIu64 " %" PRIu64 " %" xstr(MAX_HASH_ALGO_LEN) "s %" xstr(MAX_HASH_DATA_LEN) "s %" xstr(MAX_HASH_DATA_LEN) "s",
                   &table->version,
                   &table->data_block_size,
                   &table->hash_block_size,
                   &table->data_blocks,
                   &table->hash_start_block,
                   table->hash_algorithm,
                   table->root_hash,
                   table->salt) != 8) {
                error("failed to parse verity table");
                goto done;
        }

        ret = 0;

done:
        close(fd);
        return ret;
}

int verity_create(const char *name, const char *blkdev)
{
        int ret;
        struct verity_table table;
        pid_t child;
        int status;
        char table_arg[512];
        char *prog[7];

        ret = parse_verity_table(blkdev, &table);
        if (ret) {
                error("failed to parse verity table");
                return -1;
        }

        child = fork();
        if (child == -1) {
                error("failed to create dmsetup process");
                return -1;
        }

        if (!child) {
                memset(table_arg, 0, sizeof(table_arg));

                // The dm device size cannot be larger than the number of data blocks.
                ret = snprintf(table_arg,
                               sizeof(table_arg) - 1,
                               "0 %lu verity %u %s %s %u %u %" PRIu64 " %" PRIu64 " %s %s %s",
                               (table.data_blocks * table.data_block_size) / SECTOR_SIZE,
                               table.version,
                               blkdev,
                               blkdev,
                               table.data_block_size,
                               table.hash_block_size,
                               table.data_blocks,
                               table.hash_start_block,
                               table.hash_algorithm,
                               table.root_hash,
                               table.salt);
                if (ret > sizeof(table_arg) - 1) {
                        error("table argument size %d larger than buffer size 0x%zx", ret, sizeof(table_arg) - 1);
                        return -1;
                }

                info("table: '%s'", table_arg);

                prog[0] = DMSETUP_PATH;
                prog[1] = "create";
                prog[2] = (char *)name;
                prog[3] = "-r";
                prog[4] = "--table";
                prog[5] = table_arg;
                prog[6] = NULL;

                execv(prog[0], prog);

                error("failed to exec '%s'", prog[0]);
                exit(1);
        }

        if (waitpid(child, &status, 0) == -1) {
                error("failed to wait for dmsetup process");
                return -1;
        }

        if (!WIFEXITED(status)) {
                error("dmsetup process abnormal exit");
                return -1;
        }

        if (WEXITSTATUS(status)) {
                error("dmsetup process failed: %d", WEXITSTATUS(status));
                return -1;
        }

        return 0;
}
