################################################################################
#
# minijail
#
################################################################################

MINIJAIL_VERSION = db19bfbfbdce0f2b86f53d36392e49cb8f1645d6
MINIJAIL_SITE = https://android.googlesource.com/platform/external/minijail
MINIJAIL_SITE_METHOD = git
MINIJAIL_LICENSE = BSD-3c
MINIJAIL_LICENSE_FILES = NOTICE
MINIJAIL_DEPENDENCIES = libcap

MINIJAIL_MAKE_OPTS = \
    ARCH=$(ARCH) \
    CC=$(TARGET_CC) \
    BUILD_CC="$(HOSTCC)"

define MINIJAIL_BUILD_CMDS
	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(MINIJAIL_MAKE_OPTS)
endef

define MINIJAIL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/minijail0 $(TARGET_DIR)/bin/minijail0
	$(INSTALL) -D -m 0755 $(@D)/libminijailpreload.so $(TARGET_DIR)/lib/libminijailpreload.so
	$(INSTALL) -D -m 0755 $(@D)/libminijail.so $(TARGET_DIR)/lib/libminijail.so
	$(INSTALL) -D -m 0644 $(MINIJAIL_PKGDIR)/minijail.apparmor $(TARGET_DIR)/etc/apparmor.d/abstractions/minijail
endef

$(eval $(generic-package))
