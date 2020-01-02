################################################################################
#
# Kafel
#
################################################################################

KAFEL_VERSION = 722b93a630e53ca472a4c69f61cb3dfc44ea5041
KAFEL_SITE = $(call github,google,kafel,$(KAFEL_VERSION))
KAFEL_SOURCE = kafel-$(KAFEL_VERSION).tar.gz
KAFEL_LICENSE = Apache-2.0
KAFEL_LICENSE_FILES = LICENSE
KAFEL_DEPENDENCIES = \
    host-bison \
    host-flex

HOST_KAFEL_DEPENDENCIES = \
    host-bison \
    host-flex \
    host-python-cffi

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

define HOST_KAFEL_BUILD_CMDS
    mkdir -p $(@HOST_DIR)/usr/include/
    cd $(@D) && $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE)
endef

define HOST_KAFEL_INSTALL_CMDS
    $(INSTALL) -D -m 0444 $(@D)/include/kafel.h $(HOST_DIR)/usr/include/kafel.h
    $(INSTALL) -D -m 0755 $(@D)/libkafel.a $(HOST_DIR)/usr/lib/libkafel.a
    $(INSTALL) -D -m 0755 $(@D)/libkafel.so $(HOST_DIR)/usr/lib/libkafel.so
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
