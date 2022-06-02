################################################################################
#
# libswitchroot
#
################################################################################

LIBSWITCHROOT_VERSION = 0
LIBSWITCHROOT_SITE = $(shell readlink -f $(LIBSWITCHROOT_PKGDIR))
LIBSWITCHROOT_SITE_METHOD = local
LIBSWITCHROOT_LICENSE = GPLv2
LIBSWITCHROOT_INSTALL_STAGING = YES

define LIBSWITCHROOT_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wall -Werror -c -fPIC -o $(@D)/switchroot.o $(@D)/switchroot.c
	$(TARGET_CC) $(TARGET_LDFLAGS) -shared -o $(@D)/libswitchroot.so $(@D)/switchroot.o
	$(TARGET_AR) rcs $(@D)/libswitchroot.a $(@D)/switchroot.o
endef

define LIBSWITCHROOT_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/switchroot.h $(STAGING_DIR)/usr/include/switchroot.h
	$(INSTALL) -D -m 0755 $(@D)/libswitchroot.a $(STAGING_DIR)/usr/lib/libswitchroot.a
	$(INSTALL) -D -m 0755 $(@D)/libswitchroot.so $(STAGING_DIR)/usr/lib/libswitchrootheci.so
endef

define LIBSWITCHROOT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libswitchroot.so $(TARGET_DIR)/usr/lib/libswitchroot.so
endef

$(eval $(generic-package))
