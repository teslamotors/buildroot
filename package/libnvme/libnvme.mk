################################################################################
#
# libnvme
#
################################################################################

LIBNVME_VERSION = be3308357d82c1be5f82769cf3e3a73e80fbd968
LIBNVME_SITE = $(call github,linux-nvme,libnvme,$(LIBNVME_VERSION))
LIBNVME_LICENSE = LGPL
LIBNVME_LICENSE_FILES = COPYING
LIBNVME_DEPENDENCIES = util-linux
LIBNVME_INSTALL_STAGING = YES

define LIBNVME_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -I$(@D)/ccan -D _GNU_SOURCE" -C $(@D) src
endef

define LIBNVME_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/libnvme.so.1.0.1 $(TARGET_DIR)/usr/lib/libnvme.so.1.0.1
	ln -sf libnvme.so.1.0.1 $(TARGET_DIR)/usr/lib/libnvme.so.1
	ln -sf libnvme.so.1.0.1 $(TARGET_DIR)/usr/lib/libnvme.so
endef

define LIBNVME_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
endef

$(eval $(generic-package))
