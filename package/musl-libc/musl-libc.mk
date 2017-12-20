################################################################################
#
# musl-libc toolchain builder
#
################################################################################

MUSL_LIBC_VERSION = 50d026f22e4adb94d35bed558de82d9f1c8473d8
MUSL_LIBC_SITE = ssh://internal-server/internal-repo
MUSL_LIBC_SITE_METHOD = git
MUSL_LIBC_LICENSE = MIT
MUSL_LIBC_LICENSE_FILES = musl-1.1.17/COPYRIGHT

MUSL_LIBC_TARGET=$(ARCH)-$(TARGET_OS)-musl$(ABI)

# Needed in order to compile the updater as a PIE. Yum.
MUSL_CFLAGS = -fPIC

define HOST_MUSL_LIBC_BUILD_CMDS
	$(MAKE) -C $(@D) CFLAGS=$(MUSL_CFLAGS) TARGET=$(MUSL_LIBC_TARGET)
endef

define HOST_MUSL_LIBC_INSTALL_CMDS
	$(MAKE) -C $(@D) install TARGET=$(MUSL_LIBC_TARGET) OUTPUT=$(HOST_DIR)
endef

$(eval $(host-generic-package))
