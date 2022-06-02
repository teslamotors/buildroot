################################################################################
#
# capicxx-core-runtime-avb
#
################################################################################

CAPICXX_CORE_RUNTIME_AVB_VERSION = 3.1.12
CAPICXX_CORE_RUNTIME_AVB_SITE = $(call github,GENIVI,capicxx-core-runtime,$(CAPICXX_CORE_RUNTIME_AVB_VERSION))
CAPICXX_CORE_RUNTIME_AVB_LICENSE = Mozilla2.0
CAPICXX_CORE_RUNTIME_AVB_LICENSE_FILES = LICENSE
CAPICXX_CORE_RUNTIME_AVB_INSTALL_STAGING = YES

# If selected, ensure capicxx-core-runtime is built before capicxx-core-runtime-avb to avoid
# intermittent build failures due to parallel make causing both capicxx-core-runtime packages
# to attempt target install at the same time.
ifeq ($(BR2_PACKAGE_CAPICXX_CORE_RUNTIME),y)
CAPICXX_CORE_RUNTIME_AVB_DEPENDENCIES = capicxx-core-runtime
endif

CAPICXX_CORE_RUNTIME_AVB_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS)"

$(eval $(cmake-package))
