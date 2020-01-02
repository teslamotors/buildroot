################################################################################
#
# musl-libc toolchain builder
#
################################################################################

MUSL_LIBC_VERSION = 9ad768ae81ee79071ef291ce555f1bf30f8c3979
MUSL_LIBC_SITE = ssh://internal-server/internal-repo
MUSL_LIBC_SITE_METHOD = git
MUSL_LIBC_LICENSE = MIT
MUSL_LIBC_LICENSE_FILES = musl-1.1.17/COPYRIGHT

MUSL_LIBC_TARGET=$(ARCH)-$(TARGET_OS)-musl$(ABI)

# SW-93503: Needed in order to compile the updater as a PIE. Yum.
MUSL_CFLAGS = -fPIC

define HOST_MUSL_LIBC_BUILD_CMDS
	$(MAKE) -C $(@D) CFLAGS=$(MUSL_CFLAGS) TARGET=$(MUSL_LIBC_TARGET)
endef

define HOST_MUSL_LIBC_INSTALL_CMDS
	$(MAKE) -C $(@D) install TARGET=$(MUSL_LIBC_TARGET) OUTPUT=$(HOST_DIR)
endef

$(eval $(host-generic-package))
