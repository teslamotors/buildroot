################################################################################
#
# capicxx-core-runtime
#
################################################################################

CAPICXX_CORE_RUNTIME_VERSION = 3.1.10.1

CAPICXX_CORE_RUNTIME_SITE = $(call github,GENIVI,capicxx-core-runtime,$(CAPICXX_CORE_RUNTIME_VERSION))
CAPICXX_CORE_RUNTIME_INSTALL_STAGING = YES
CAPICXX_CORE_RUNTIME_LICENSE = Mozilla2.0
CAPICXX_CORE_RUNTIME_LICENSE_FILES = LICENSE
CAPICXX_CORE_RUNTIME_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install -j1

# The AVB stream handler from Intel requires version 3.1.5 of the
# CommonAPI core runtime library whereas the Harman tuner interfaces
# required 3.1.10.4.
#
# We can resolve the conflict in the .so files with appropriate use of
# symlinks, but the downstream code (capicxx-someip-runtime,
# harman-tuner, and tunert) also need the correct version of the
# header files.  So we stage this package into a different directory
# and adjust the scripts for the client packages accordingly.
#
# The symlinks on the target automatically ended up a bit strange, but
# it works.
#
#     libCommonAPI.so -> libCommonAPI.so.3.1.10
#     libCommonAPI.so.3 -> libCommonAPI.so.3.1.5
#     libCommonAPI.so.3.1.10
#     libCommonAPI.so.3.1.5

CAPICXX_CORE_RUNTIME_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)/opt/tuner install -j1

$(eval $(cmake-package))
