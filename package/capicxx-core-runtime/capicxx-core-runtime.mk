################################################################################
#
# capicxx-core-runtime
#
################################################################################

CAPICXX_CORE_RUNTIME_VERSION = 3.1.12

CAPICXX_CORE_RUNTIME_SITE = $(call github,GENIVI,capicxx-core-runtime,$(CAPICXX_CORE_RUNTIME_VERSION))
CAPICXX_CORE_RUNTIME_INSTALL_STAGING = YES
CAPICXX_CORE_RUNTIME_LICENSE = Mozilla2.0
CAPICXX_CORE_RUNTIME_LICENSE_FILES = LICENSE

CAPICXX_CORE_RUNTIME_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS)"

CAPICXX_CORE_RUNTIME_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install/fast

$(eval $(cmake-package))
