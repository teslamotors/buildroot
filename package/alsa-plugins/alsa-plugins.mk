#############################################################
#
# alsa-plugins
#
#############################################################
ALSA_PLUGINS_VERSION = 1.1.1
ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
ALSA_PLUGINS_SITE = ftp://ftp.alsa-project.org/pub/plugins
ALSA_PLUGINS_INSTALL_STAGING = NO
ALSA_PLUGINS_BUILD_OPKG = YES
ALSA_PLUGINS_LICENSE = LGPLv2.1+
ALSA_PLUGINS_LICENSE_FILES = COPYING
ALSA_PLUGINS_SECTION = audio
ALSA_PLUGINS_DESCRIPTION = Advanced Linux Sound Architecture plugins
ALSA_PLUGINS_OPKG_DEPENDENCIES = alsa-lib,libsamplerate
ALSA_PLUGINS_DEPENDENCIES = alsa-lib libsamplerate

ALSA_PLUGINS_CONF_OPTS +=  \
	--localstatedir=/var \
	--disable-jack \
	--enable-samplerate \
	--disable-pulseaudio \
	--disable-avcodec \
	--with-speex=builtin

$(eval $(autotools-package))
