################################################################################
#
# minijail
#
################################################################################

MINIJAIL_VERSION = cb8674d56e3f148d867b17ee549c5d3e8f1d1bb5
MINIJAIL_SITE = https://android.googlesource.com/platform/external/minijail
MINIJAIL_SITE_METHOD = git
MINIJAIL_LICENSE = BSD-3c
MINIJAIL_LICENSE_FILES = NOTICE
MINIJAIL_INSTALL_STAGING = YES
MINIJAIL_DEPENDENCIES = libcap kafel

MINIJAIL_MAKE_OPTS = \
    ARCH=$(ARCH) \
    CC=$(TARGET_CC) \
    BUILD_CC="$(HOSTCC)"

define MINIJAIL_BUILD_CMDS
	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(MINIJAIL_MAKE_OPTS)
endef

define MINIJAIL_INSTALL_STAGING_CMDS
	cp $(@D)/libminijail.so $(STAGING_DIR)/lib/
	cp $(@D)/libminijail.h $(STAGING_DIR)/usr/include/
endef

define MINIJAIL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/minijail0 $(TARGET_DIR)/bin/minijail0
	$(INSTALL) -D -m 0755 $(@D)/libminijailpreload.so $(TARGET_DIR)/lib/libminijailpreload.so
	$(INSTALL) -D -m 0755 $(@D)/libminijail.so $(TARGET_DIR)/lib/libminijail.so
endef

$(eval $(generic-package))
