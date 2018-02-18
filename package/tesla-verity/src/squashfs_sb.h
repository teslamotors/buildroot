#ifndef _VERITY_INIT_SQUASHFS_SB_H
#define _VERITY_INIT_SQUASHFS_SB_H

#include <stdint.h>

/*
 * https://github.com/torvalds/linux/blob/master/fs/squashfs/squashfs_fs.h#L246
 * Modified with stdint types.
 */
struct squashfs_super_block {
        uint32_t s_magic;
        uint32_t inodes;
        int32_t  mkfs_time /* time of filesystem creation */;
        uint32_t block_size;
        uint32_t fragments;
        uint16_t compression;
        uint16_t block_log;
        uint16_t flags;
        uint16_t no_ids;
        uint16_t s_major;
        uint16_t s_minor;
        uint64_t root_inode;
        uint64_t bytes_used;
        uint64_t id_table_start;
        uint64_t xattr_id_table_start;
        uint64_t inode_table_start;
        uint64_t directory_table_start;
        uint64_t fragment_table_start;
        uint64_t lookup_table_start;
};

#endif
