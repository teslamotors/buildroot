#############################################################
#
# fluidsynth
#
#############################################################

FLUIDSYNTH_VERSION = 1.1.6
FLUIDSYNTH_SITE = http://sourceforge.net/projects/fluidsynth/files/fluidsynth-$(FLUIDSYNTH_VERSION)
FLUIDSYNTH_SOURCE = fluidsynth-$(FLUIDSYNTH_VERSION).tar.gz
FLUIDSYNTH_LICENSE = LGPLv2+
FLUIDSYNTH_LICENSE_FILES = COPYING
FLUIDSYNTH_INSTALL_STAGING = YES

FLUIDSYNTH_DEPENDENCIES = alsa-lib libglib2

$(eval $(cmake-package))