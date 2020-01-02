#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <sys/mount.h>

#include "log.h"
#include "verity.h"
#include "switch_root.h"

// Maximum wait for the root device - retries * delay - 5secs
#define BLKDEV_WAIT_RETRIES  500
#define BLKDEV_WAIT_DELAY_MS 10

#define CMDLINE_MAX_SIZE 2048

#ifdef AP_HW2

#define CMDLINE_BANK_A   "bootpart=kernel-a"
#define CMDLINE_BANK_B   "bootpart=kernel-b"
static const char bank_a_blkdev[] = "/dev/mmcblk0p1";
static const char bank_b_blkdev[] = "/dev/mmcblk0p2";

#elif defined AP_HW3

#define CMDLINE_BANK_A   "bootfrom=ua"
#define CMDLINE_BANK_B   "bootfrom=ub"
static const char bank_a_blkdev[] = "/dev/sda4";
static const char bank_b_blkdev[] = "/dev/sda5";

#elif defined ICE_MRB

#define CMDLINE_BANK_A   "bootpart=kernel-a"
#define CMDLINE_BANK_B   "bootpart=kernel-b"
static const char bank_a_blkdev[] = "/dev/mmcblk0p2";
static const char bank_b_blkdev[] = "/dev/mmcblk0p3";

#else

#error No target specified

#endif

static const char init[] = "/sbin/init";

static const char *get_root_blkdev(void)
{
        int fd;
        ssize_t count;
        char cmdline[CMDLINE_MAX_SIZE];
        const char *blkdev = NULL;

        fd = open("/proc/cmdline", O_RDONLY);
        if (fd == -1) {
                error("failed to open '/proc/cmdline'");
                return NULL;
        }

        count = read(fd, cmdline, sizeof(cmdline) - 1);
        if (count == -1) {
                error("failed to read '/proc/cmdline'");
                goto done;
        }

        cmdline[count] = '\0';

        if (strstr(cmdline, CMDLINE_BANK_A))
                blkdev = bank_a_blkdev;
        else if (strstr(cmdline, CMDLINE_BANK_B))
                blkdev = bank_b_blkdev;
        else
                error("%s/%s not found in '/proc/cmdline'", CMDLINE_BANK_A, CMDLINE_BANK_B);

done:
        close(fd);
        return blkdev;
}

static int wait_for_blkdev(const char *path, unsigned int retry_count, unsigned int delay_ms)
{
        int ret;
        int i;
        struct stat st;

        for (i = 0; i < retry_count; i++) {
                ret = stat(path, &st);
                if (ret) {
                        usleep(1000 * delay_ms);
                        continue;
                }

                if (!S_ISBLK(st.st_mode))
                        return -1;

                return 0;
        }

        return -1;
}

static int mount_verity_blkdev(const char *blkdev, const char *name, const char *mnt)
{
        int ret;
        char dm_blkdev[128];

        ret = verity_create(name, blkdev);
        if (ret) {
                error("failed to create root verity device");
                return -1;
        }

        snprintf(dm_blkdev, sizeof(dm_blkdev), "/dev/mapper/%s", name);

        ret = wait_for_blkdev(dm_blkdev, BLKDEV_WAIT_RETRIES, BLKDEV_WAIT_DELAY_MS);
        if (ret) {
                error("verity block device never appeared");
                return -1;
        }

        ret = mount(dm_blkdev, mnt, "squashfs", MS_SILENT | MS_RDONLY, NULL);
        if (ret) {
                error("failed to mount verity block device");
                return -1;
        }

        return 0;
}

int main(int argc, char **argv, char **envp)
{
        int ret;
        int fd;
        const char *blkdev;
        char *const init_argv[2] = { (char *const)init, NULL };

        // devtmpfs does not get automounted when initramfs is used.
        ret = mount("devtmpfs", "/dev", "devtmpfs", MS_SILENT, NULL);
        if (ret) {
                error("failed to mount '/dev'");
                return -1;
        }

        setsid();

        fd = open("/dev/console", O_WRONLY | O_NONBLOCK);
        if (fd >= 0) {
                dup2(fd, STDIN_FILENO);
                dup2(fd, STDOUT_FILENO);
                dup2(fd, STDERR_FILENO);
                if (fd > STDERR_FILENO)
                        close(fd);
        }

        log_open();

        info("verity-init booting");

        ret = mount("none", "/proc", "proc", MS_SILENT, NULL);
        if (ret) {
                error("failed to mount '/proc'");
                return -1;
        }

        ret = mount("none", "/sys", "sysfs", MS_SILENT, NULL);
        if (ret) {
                error("failed to mount '/sys'");
                return 1;
        }

        blkdev = get_root_blkdev();
        if (!blkdev) {
                error("failed to determine online root block device");
                return -1;
        }

        info("root block device: %s", blkdev);

        ret = wait_for_blkdev(blkdev, BLKDEV_WAIT_RETRIES, BLKDEV_WAIT_DELAY_MS);
        if (ret) {
                error("root block device never appeared");
                return -1;
        }

        ret = mount_verity_blkdev(blkdev, "rootfs", "/mnt");
        if (ret) {
                error("failed to mount root block device with verity");
                return -1;
        }

        info("switching root and executing %s", init);

        ret = umount("/sys");
        if (ret) {
                error("failed to unmount '/sys'");
                return -1;
        }

        ret = umount("/proc");
        if (ret) {
                error("failed to unmount '/proc'");
                return -1;
        }

        ret = umount2("/dev", MNT_DETACH);
        if (ret) {
                error("failed to unmount '/dev'");
                return -1;
        }

        switch_root("/mnt", init, init_argv, envp);

        error("failed to switch root");
        return -1;
}
