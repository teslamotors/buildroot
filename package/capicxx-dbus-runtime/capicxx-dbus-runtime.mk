################################################################################
#
# capicxx-dbus-runtime
#
################################################################################

CAPICXX_DBUS_RUNTIME_VERSION = 3.1.5
CAPICXX_DBUS_RUNTIME_SITE = $(call github,GENIVI,capicxx-dbus-runtime,$(CAPICXX_DBUS_RUNTIME_VERSION))
CAPICXX_DBUS_RUNTIME_INSTALL_STAGING = YES
CAPICXX_DBUS_RUNTIME_LICENSE = Mozilla2.0
CAPICXX_DBUS_RUNTIME_LICENSE_FILES = LICENSE
CAPICXX_DBUS_RUNTIME_DEPENDENCIES = capicxx-core-runtime-avb dbus
CAPICXX_DBUS_RUNTIME_CONF_OPTS = -DCMAKE_PREFIX_PATH=/usr/lib/cmake/CommonAPI-$(CAPICXX_DBUS_RUNTIME_VERSION)
CAPICXX_DBUS_RUNTIME_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install -j1
CAPICXX_DBUS_RUNTIME_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install -j1

$(eval $(cmake-package))
