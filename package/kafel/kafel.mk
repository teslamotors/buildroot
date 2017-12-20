################################################################################
#
# Kafel
#
################################################################################

KAFEL_VERSION = 1.0.0
KAFEL_SITE = $(call, github,google,kafel,$(KAFEL_VERSION))
KAFEL_SOURCE = kafel-$(KAFEL_VERSION).tar.gz
KAFEL_LICENSE = Apache-2.0
KAFEL_LICENSE_FILES = LICENSE
KAFEL_DEPENDENCIES = \
    host-bison \
    host-flex

KAFEL_MAKE_OPTS = \
    CC=$(TARGET_CC) \
    LD=$(TARGET_LD) \
    AR=$(TARGET_AR) \
    OBJCOPY=$(TARGET_OBJCOPY) \
    CFLAGS="$(TARGET_CFLAGS)"

define KAFEL_BUILD_CMDS
    cd $(@D) && $(TARGET_MAKE_ENV) $(KAFEL_MAKE_OPTS) $(MAKE)
endef

define KAFEL_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0444 $(@D)/include/kafel.h $(STAGING_DIR)/usr/include/kafel.h
    $(INSTALL) -D -m 0755 $(@D)/libkafel.a $(STAGING_DIR)/usr/lib/libkafel.a
    $(INSTALL) -D -m 0755 $(@D)/libkafel.so $(TARGET_DIR)/usr/lib/libkafel.so
endef

$(eval $(generic-package))
