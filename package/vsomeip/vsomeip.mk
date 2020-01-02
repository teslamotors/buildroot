################################################################################
#
# vsomeip
#
################################################################################

VSOMEIP_VERSION = 2.7.0

VSOMEIP_SITE = $(call github,GENIVI,vsomeip,$(VSOMEIP_VERSION))
VSOMEIP_INSTALL_STAGING = YES
VSOMEIP_LICENSE = Mozilla2.0
VSOMEIP_LICENSE_FILES = LICENSE LICENSE_boost
VSOMEIP_DEPENDENCIES = boost
VSOMEIP_CONF_OPTS = -DENABLE_SIGNAL_HANDLING=0 -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -Wl,-z,lazy" -DCMAKE_SHARED_LINKER_FLAGS="$(TARGET_LDFLAGS) -z lazy"

$(eval $(cmake-package))
