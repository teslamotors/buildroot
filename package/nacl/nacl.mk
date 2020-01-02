################################################################################
#
# nacl
#
################################################################################

NACL_VERSION = ad40fdf6aaa4c64cc06ad30b2acbe285ceaa834e
NACL_SITE = https://internal-server/internal-repo
NACL_SITE_METHOD = git
NACL_INSTALL_STAGING = YES
NACL_LICENSE = NaCl

ifeq ($(GNU_TARGET_NAME),$(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-musl$(ABI))
  NACL_CROSS_BUILD_VARS += PATH=$(HOST_DIR)/bin:$(PATH)
  NACL_CROSS_BUILD_VARS += CC=$(TARGET_CC)
  NACL_CROSS_BUILD_VARS += LD=$(TARGET_LD)
  NACL_CROSS_BUILD_VARS += AR=$(TARGET_AR)
else
  NACL_DEPENDENCIES = host-musl-libc

  NACL_CROSS_BUILD_VARS += PATH=$(HOST_DIR)/bin:$(PATH)
  NACL_CROSS_BUILD_VARS += CC=$(ARCH)-$(TARGET_OS)-musl$(ABI)-gcc
  NACL_CROSS_BUILD_VARS += LD=$(ARCH)-$(TARGET_OS)-musl$(ABI)-ld
  NACL_CROSS_BUILD_VARS += AR=$(ARCH)-$(TARGET_OS)-musl$(ABI)-ar
endif

# SW-93503: Needed in order to compile the updater as a PIE. Yum.
NACL_CFLAGS = -fPIC

define NACL_BUILD_CMDS
	$(MAKE) -C $(@D) CFLAGS=$(NACL_CFLAGS) $(NACL_CROSS_BUILD_VARS)
endef

define NACL_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) $(NACL_CROSS_BUILD_VARS) DESTDIR=$(STAGING_DIR) install
endef

define HOST_NACL_BUILD_CMDS
	$(MAKE) -C $(@D) CFLAGS=$(NACL_CFLAGS)
endef

define HOST_NACL_INSTALL_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/usr install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
