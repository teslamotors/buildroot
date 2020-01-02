################################################################################
#
# linux-syscall-support
#
################################################################################

# Use the same version that the one used by Google-breakpad (see DEPS file)
AP_LINUX_SYSCALL_SUPPORT_VERSION = 3f6478ac95edf86cd3da300c2c0d34a438f5dbeb
AP_LINUX_SYSCALL_SUPPORT_SITE = https://chromium.googlesource.com/linux-syscall-support
AP_LINUX_SYSCALL_SUPPORT_SITE_METHOD = git
AP_LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3-Clause
AP_LINUX_SYSCALL_SUPPORT_LICENSE_FILES = linux_syscall_support.h

# Provide only one header file.
AP_LINUX_SYSCALL_SUPPORT_INSTALL_TARGET = NO
AP_LINUX_SYSCALL_SUPPORT_INSTALL_STAGING = YES

define AP_LINUX_SYSCALL_SUPPORT_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
		$(STAGING_DIR)/usr/include/linux_syscall_support.h
endef

define HOST_AP_LINUX_SYSCALL_SUPPORT_INSTALL_CMDS
	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
		$(HOST_DIR)/include/linux_syscall_support.h
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
