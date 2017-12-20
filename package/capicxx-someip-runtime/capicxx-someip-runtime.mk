################################################################################
#
# capicxx-someip-runtime
#
################################################################################

CAPICXX_SOMEIP_RUNTIME_VERSION = 3.1.10.4

CAPICXX_SOMEIP_RUNTIME_SITE = $(call github,GENIVI,capicxx-someip-runtime,$(CAPICXX_SOMEIP_RUNTIME_VERSION))
CAPICXX_SOMEIP_RUNTIME_INSTALL_STAGING = YES
CAPICXX_SOMEIP_RUNTIME_LICENSE = Mozilla2.0
CAPICXX_SOMEIP_RUNTIME_LICENSE_FILES = LICENSE
CAPICXX_SOMEIP_RUNTIME_DEPENDENCIES = vsomeip capicxx-core-runtime

# See comments in capicxx-core-runtime package for information about /opt/tuner.
CAPICXX_SOMEIP_RUNTIME_CONF_OPTS = -DCMAKE_PREFIX_PATH=/opt/tuner/usr/lib/cmake/CommonAPI-3.1.10

$(eval $(cmake-package))
