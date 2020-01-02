################################################################################
#
# tesla-libsystemd
#
################################################################################

TESLA_LIBSYSTEMD_VERSION = 0
TESLA_LIBSYSTEMD_SITE = $(shell readlink -f $(TESLA_LIBSYSTEMD_PKGDIR))
TESLA_LIBSYSTEMD_SITE_METHOD = local
TESLA_LIBSYSTEMD_LICENSE = Tesla

define TESLA_LIBSYSTEMD_BUILD_CMDS
	cd $(@D)										\
	&& $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wall -Werror -fPIC -c libsystemd.c	\
	&& $(TARGET_CC) $$(TARGET_LDFLAGS) -shared -o libsystemd.so libsystemd.o
endef

define TESLA_LIBSYSTEMD_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0644 $(@D)/libsystemd.so $(TARGET_DIR)/usr/lib/libsystemd.so
	ln -sf /usr/lib/libsystemd.so $(TARGET_DIR)/usr/lib/libsystemd.so.0
endef

$(eval $(generic-package))
