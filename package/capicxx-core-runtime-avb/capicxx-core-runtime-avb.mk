################################################################################
#
# capicxx-core-runtime-avb
#
################################################################################

# We really want version 3.1.5, but it Looks like they screwed up the
# 3.1.5 tag on this repo, so use the commit instead.
CAPICXX_CORE_RUNTIME_AVB_USER_VERSION = 3.1.5
CAPICXX_CORE_RUNTIME_AVB_VERSION = 77d9cdaf6acee03a1e360e0e1a3cd0b01a95b407

CAPICXX_CORE_RUNTIME_AVB_SITE = $(call github,GENIVI,capicxx-core-runtime,$(CAPICXX_CORE_RUNTIME_AVB_VERSION))
CAPICXX_CORE_RUNTIME_AVB_INSTALL_STAGING = YES
CAPICXX_CORE_RUNTIME_AVB_LICENSE = Mozilla2.0
CAPICXX_CORE_RUNTIME_AVB_LICENSE_FILES = LICENSE

CAPICXX_CORE_RUNTIME_AVB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install -j1
CAPICXX_CORE_RUNTIME_AVB_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install -j1

$(eval $(cmake-package))
