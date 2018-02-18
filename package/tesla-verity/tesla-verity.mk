################################################################################
#
# tesla-verity
#
################################################################################

TESLA_VERITY_VERSION = 0
TESLA_VERITY_SITE = $(shell readlink -f $(TESLA_VERITY_PKGDIR))
TESLA_VERITY_SITE_METHOD = local
TESLA_VERITY_LICENSE = GPLv2
TESLA_VERITY_DEPENDENCIES = openssl lvm2

TESLA_VERITY_LIBRARIES = -lcrypto

ifeq ($(BR2_PACKAGE_TESLA_VERITY_AP_HW2),y)
TESLA_VERITY_TARGET = AP_HW2
TESLA_VERITY_DEV_PUBKEY = verity-vehicle-dev.pub
TESLA_VERITY_PROD_PUBKEY = verity-vehicle-prod.pub
else ifeq ($(BR2_PACKAGE_TESLA_VERITY_ICE_MRB),y)
TESLA_VERITY_TARGET = ICE_MRB
TESLA_VERITY_DEV_PUBKEY = verity-vehicle-dev.pub
TESLA_VERITY_PROD_PUBKEY = verity-vehicle-prod.pub
TESLA_VERITY_DEPENDENCIES += libheci
TESLA_VERITY_LIBRARIES += -lheci
endif

define TESLA_VERITY_BUILD_CMDS
	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -D$(TESLA_VERITY_TARGET) -Wall -Werror -o verity-init src/*.c $(TESLA_VERITY_LIBRARIES)
endef

define TESLA_VERITY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0700 $(@D)/verity-init $(TARGET_DIR)/init
	$(INSTALL) -D -m 0400 $(@D)/$(TESLA_VERITY_DEV_PUBKEY) $(TARGET_DIR)/etc/verity-dev.pub
	$(INSTALL) -D -m 0400 $(@D)/$(TESLA_VERITY_PROD_PUBKEY) $(TARGET_DIR)/etc/verity-prod.pub
endef

$(eval $(generic-package))
