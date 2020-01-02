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
TESLA_VERITY_PUBLIC_KEYS = verity-autopilot_hw2-dev.pub verity-autopilot_hw2-prod.pub
else ifeq ($(BR2_PACKAGE_TESLA_VERITY_AP_HW3),y)
TESLA_VERITY_TARGET = AP_HW3
TESLA_VERITY_PUBLIC_KEYS = verity-autopilot_hw3-prov.pub \
			   verity-autopilot_hw3-dev.pub \
			   verity-autopilot_hw3-prod.pub
else ifeq ($(BR2_PACKAGE_TESLA_VERITY_ICE_MRB),y)
TESLA_VERITY_TARGET = ICE_MRB
TESLA_VERITY_PUBLIC_KEYS = verity-vehicle-dev.pub verity-vehicle-prod.pub
TESLA_VERITY_DEPENDENCIES += libheci
TESLA_VERITY_LIBRARIES += -lheci
endif

define TESLA_VERITY_BUILD_CMDS
	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -D$(TESLA_VERITY_TARGET) -Wall -Werror -o verity-init src/*.c $(TESLA_VERITY_LIBRARIES)
endef

define TESLA_VERITY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0700 $(@D)/verity-init $(TARGET_DIR)/init
	for key in $(TESLA_VERITY_PUBLIC_KEYS); do \
		$(INSTALL) -D -m 0400 $(@D)/"$$key" $(TARGET_DIR)/etc/"$$(echo "$$key" | cut -d '-' -f 1,3-)"; \
	done
endef

$(eval $(generic-package))
