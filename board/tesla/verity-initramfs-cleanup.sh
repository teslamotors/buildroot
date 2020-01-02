#!/bin/bash -xe
#
# Removes unused libraries from a tesla-verity initramfs
#

TARGET=$1

# We only need libcrypto from openssl
rm -f "$TARGET"/usr/lib/libssl.so*
rm -rf "$TARGET"/etc/ssl

# We only need dmsetup and associated dependencies from lvm2
rm -f "$TARGET"/usr/lib/libdevmapper-event.so*
rm -f "$TARGET"/usr/sbin/dmeventd
rm -f "$TARGET"/usr/sbin/blkdeactivate

# We don't use compression
rm -f "$TARGET"/usr/lib/libz*
