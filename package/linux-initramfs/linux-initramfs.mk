################################################################################
#
# linux-initramfs: build linux initramfs from another buildroot target.
#
################################################################################

LINUX_INITRAMFS_VERSION=1
LINUX_INITRAMFS_SITE = $(shell readlink -f $(LINUX_INITRAMFS_PKGDIR))
LINUX_INITRAMFS_SITE_METHOD = local
LINUX_INITRAMFS_LICENSE = Tesla
LINUX_INITRAMFS_BR2_PRIMARY_SITE = $(if $(BR2_PRIMARY_SITE),BR2_PRIMARY_SITE=$(BR2_PRIMARY_SITE))
LINUX_INITRAMFS_INSTALL_IMAGES = YES

ifeq ($(BUILDROOT_CACHE_VERSION),2)
ifeq ($(POPULATE_BUILD_FROM_CACHE),TRUE)
define LINUX_INITRAMFS_SHARED_CACHE_LOAD_HOOK
	+$(MAKE) \
		-C $(@D)/output \
		SHARED_CACHE_HELPER=$(SHARED_CACHE_HELPER) \
		SHARED_CACHE_DIR=$(SHARED_CACHE_DIR)/$(LINUX_INITRAMFS_NAME) \
		SHARED_CACHE_DEBUG_DIR=$(SHARED_CACHE_DEBUG_DIR)/$(LINUX_INITRAMFS_NAME) \
		cache-load
	+$(MAKE) -C $(@D)/output cache-stats
endef
LINUX_INITRAMFS_PRE_BUILD_HOOKS += LINUX_INITRAMFS_SHARED_CACHE_LOAD_HOOK
endif
endif

ifeq ($(BUILDROOT_CACHE_VERSION),2)
ifeq ($(CREATE_CACHE_AFTER_BUILD),TRUE)
define LINUX_INITRAMFS_SHARED_CACHE_SAVE_HOOK
	+$(MAKE) \
		-C $(@D)/output \
		SHARED_CACHE_HELPER=$(SHARED_CACHE_HELPER) \
		SHARED_CACHE_DIR=$(SHARED_CACHE_DIR)/$(LINUX_INITRAMFS_NAME) \
		SHARED_CACHE_DEBUG_DIR=$(SHARED_CACHE_DEBUG_DIR)/$(LINUX_INITRAMFS_NAME) \
		cache-save
	+$(MAKE) -C $(@D)/output cache-stats
endef
LINUX_INITRAMFS_POST_BUILD_HOOKS += LINUX_INITRAMFS_SHARED_CACHE_SAVE_HOOK
endif
endif

ifneq ($(BUILD_FARM),)
define LINUX_INITRAMFS_BUILDROOT_ANALYTICS
	-cp -v \
		$(@D)/output/build/build-time.log \
		$$(dirname $$(dirname $(SHARED_CACHE_DEBUG_DIR)))/artifacts/$(LINUX_INITRAMFS_NAME)-build-time.log
	-python3.7 \
		$(BR2_TESLA_FW_SRCDIR)/jenkins2/scripts/buildroot-packages-timeline.py \
		$$(dirname $$(dirname $(SHARED_CACHE_DEBUG_DIR)))/artifacts/$(LINUX_INITRAMFS_NAME)-build-time.log
endef
LINUX_INITRAMFS_POST_BUILD_HOOKS += LINUX_INITRAMFS_BUILDROOT_ANALYTICS
endif

define LINUX_INITRAMFS_CONFIGURE_CMDS
	mkdir -p $(@D)/output
	cp $(@D)/../../Makefile $(@D)/output
	-cp $(@D)/../../.br2-external.mk $(@D)/output
	$(MAKE) $(BR2_PACKAGE_LINUX_INITRAMFS_TARGET) O=$(@D)/output
	CONFIG_=BR2_ support/kconfig/merge_config.sh -m -O $(@D)/output \
		$(@D)/output/.config $(BR2_PACKAGE_LINUX_INITRAMFS_CONFIG_FRAGMENT_FILES)
	$(MAKE) olddefconfig O=$(@D)/output
endef

define LINUX_INITRAMFS_BUILD_CMDS
	$(MAKE) -C $(@D)/output all $(LINUX_INITRAMFS_BR2_PRIMARY_SITE)
endef

define LINUX_INITRAMFS_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/output/images/rootfs.cpio.xz $(BINARIES_DIR)/initramfs.cpio.xz
endef

$(eval $(generic-package))
