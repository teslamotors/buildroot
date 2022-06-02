#############################################################
#
# libsndio
#
#############################################################

SNDIO_VERSION = 1.6.0
SNDIO_SITE = http://www.sndio.org
SNDIO_SOURCE = sndio-$(SNDIO_VERSION).tar.gz
SNDIO_LICENSE = ISC
SNDIO_INSTALL_STAGING = YES

SNDIO_DEPENDENCIES += \
	alsa-lib \
	libglib2 \

define SNDIO_CONFIGURE_CMDS
	cd $(@D) && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	./configure --prefix=$(STAGING_DIR)/usr \
	CC="$(TARGET_CC)" \
	LDFLAGS="$(TARGET_LDFLAGS)"
endef

define SNDIO_BUILD_CMDS
	cd $(@D) && $(MAKE) LDFLAGS="-L$(STAGING_DIR)/usr/lib"
endef

define SNDIO_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
	$(INSTALL) -D -m 0755 $(@D)/libsndio/libsndio.so* --target-directory=$(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))