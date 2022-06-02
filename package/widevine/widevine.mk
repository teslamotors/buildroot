################################################################################
#
# Widevine
#
################################################################################

# Get latest version number from: https://dl.google.com/widevine-cdm/versions.txt
WIDEVINE_VERSION = 4.10.1440.19

ifeq ($(BR2_i386),y)
WIDEVINE_ARCH = ia32
else ifeq ($(BR2_x86_64),y)
WIDEVINE_ARCH = x64
endif

WIDEVINE_SOURCE = $(WIDEVINE_VERSION)-linux-$(WIDEVINE_ARCH).zip
WIDEVINE_SITE = https://dl.google.com/widevine-cdm
WIDEVINE_LICENSE = Proprietary
WIDEVINE_LICENSE_FILES = LICENSE.txt
WIDEVINE_INSTALL_STAGING = YES

define WIDEVINE_EXTRACT_CMDS
	$(UNZIP) $(WIDEVINE_DL_DIR)/$(WIDEVINE_SOURCE) -d $(@D)
endef

define WIDEVINE_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 -t $(STAGING_DIR)/usr/lib \
			$(@D)/libwidevinecdm.so \
			$(@D)/manifest.json
endef

define WIDEVINE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/lib \
			$(@D)/libwidevinecdm.so \
			$(@D)/manifest.json
endef

$(eval $(generic-package))
