#############################################################
#
# lmms
#
#############################################################

LMMS_VERSION = eda474970b137b53928157a45f4765315bf4b233
LMMS_SITE = https://github.com/teslamotors/lmms.git
LMMS_SITE_METHOD = git
LMMS_GIT_SUBMODULES = YES
LMMS_LICENSE = LGPLv2+
LMMS_LICENSE_FILES = LICENSE.txt
LMMS_INSTALL_STAGING = YES
LMMS_DEPENDENCIES += \
	fftw-single \
	fluidsynth \
	lame \
	libsamplerate \
	libsndfile \
	qt \

LMMS_CONF_OPTS = -DQT_QMAKE_EXECUTABLE:FILEPATH=$(HOST_DIR)/usr/bin/qmake -DWANT_GENBIN2RES=OFF -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))