################################################################################
#
# capicxx-dbus-runtime
#
################################################################################

CAPICXX_DBUS_RUNTIME_VERSION = 3.1.12
CAPICXX_DBUS_RUNTIME_SITE = $(call github,GENIVI,capicxx-dbus-runtime,$(CAPICXX_DBUS_RUNTIME_VERSION))
CAPICXX_DBUS_RUNTIME_LICENSE = Mozilla2.0
CAPICXX_DBUS_RUNTIME_LICENSE_FILES = LICENSE
CAPICXX_DBUS_RUNTIME_DEPENDENCIES = capicxx-core-runtime-avb dbus
CAPICXX_DBUS_RUNTIME_INSTALL_STAGING = YES

CAPICXX_DBUS_RUNTIME_CONF_OPTS = -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-implicit-fallthrough" \
	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -Wno-implicit-fallthrough" \
	-DCMAKE_PREFIX_PATH=/usr/lib/cmake/CommonAPI-$(CAPICXX_CORE_RUNTIME_AVB_VERSION)

$(eval $(cmake-package))
