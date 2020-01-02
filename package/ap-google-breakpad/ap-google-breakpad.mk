################################################################################
#
# Autopilot google-breakpad
#
################################################################################

AP_GOOGLE_BREAKPAD_VERSION = 9eac2058b70615519b2c4d8c6bdbfca1bd079e39
AP_GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
AP_GOOGLE_BREAKPAD_SITE_METHOD = git
AP_GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
# Only a static library is installed
AP_GOOGLE_BREAKPAD_INSTALL_TARGET = NO
AP_GOOGLE_BREAKPAD_INSTALL_STAGING = YES
AP_GOOGLE_BREAKPAD_LICENSE = BSD-3c
AP_GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
AP_GOOGLE_BREAKPAD_DEPENDENCIES = ap-linux-syscall-support

HOST_AP_GOOGLE_BREAKPAD_DEPENDENCIES = host-ap-linux-syscall-support

# Avoid using depot-tools to download this file.
define HOST_AP_GOOGLE_BREAKPAD_LSS
	$(INSTALL) -D -m 0644 \
		$(HOST_DIR)/include/linux_syscall_support.h \
		$(@D)/src/third_party/lss/linux_syscall_support.h
endef
HOST_AP_GOOGLE_BREAKPAD_PRE_CONFIGURE_HOOKS += HOST_AP_GOOGLE_BREAKPAD_LSS

define AP_GOOGLE_BREAKPAD_LSS
	$(INSTALL) -D -m 0644 \
		$(STAGING_DIR)/usr/include/linux_syscall_support.h \
		$(@D)/src/third_party/lss/linux_syscall_support.h
endef
AP_GOOGLE_BREAKPAD_PRE_CONFIGURE_HOOKS += AP_GOOGLE_BREAKPAD_LSS

define AP_GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
	$(EXTRA_ENV) package/ap-google-breakpad/gen-syms.sh $(STAGING_DIR) \
		$(TARGET_DIR) $(call qstrip,$(BR2_AP_GOOGLE_BREAKPAD_INCLUDE_FILES))
endef
AP_GOOGLE_BREAKPAD_TARGET_FINALIZE_HOOKS += AP_GOOGLE_BREAKPAD_EXTRACT_SYMBOLS

$(eval $(autotools-package))
$(eval $(host-autotools-package))
