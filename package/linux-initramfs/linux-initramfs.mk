################################################################################
#
# linux-initramfs: build linux initramfs from another buildroot target.
#
################################################################################

LINUX_INITRAMFS_VERSION=1
LINUX_INITRAMFS_SITE = $(shell readlink -f $(LINUX_INITRAMFS_PKGDIR))
LINUX_INITRAMFS_SITE_METHOD = local
LINUX_INITRAMFS_LICENSE = Tesla

define LINUX_INITRAMFS_BUILD_CMDS
	mkdir -p $(@D)/output
	cp $(@D)/../../Makefile $(@D)/output
	-cp $(@D)/../../.br-external $(@D)/output
	+$(MAKE) $(BR2_PACKAGE_LINUX_INITRAMFS_TARGET) O=$(@D)/output
	+$(MAKE) -C $(@D)/output all
	$(INSTALL) -D -m 0644 $(@D)/output/images/rootfs.cpio.xz $(BINARIES_DIR)/initramfs.cpio.xz
endef

$(eval $(generic-package))
