################################################################################
#
# protobuf2
#
################################################################################

PROTOBUF2_VERSION = v2.6.1
PROTOBUF2_SITE = $(call github,google,protobuf,$(PROTOBUF2_VERSION))

PROTOBUF2_LICENSE = BSD-3c
PROTOBUF2_LICENSE_FILES = LICENSE
# no configure script
PROTOBUF2_AUTORECONF = YES
HOST_PROTOBUF2_CONF_OPTS = --prefix=$(HOST_DIR)/usr/proto2/

# N.B. Need to use host protoc during cross compilation.
PROTOBUF2_DEPENDENCIES = host-protobuf2
PROTOBUF2_CONF_OPTS = --prefix=/usr/proto2/ --exec-prefix=/usr/proto2 --with-protoc=$(HOST_DIR)/usr/proto2/bin/protoc

PROTOBUF2_INSTALL_STAGING = YES
PROTOBUF2_POST_INSTALL_TARGET_HOOKS += PROTOBUF2_SYMLINK_AFTER_INSTALL PROTOBUF2_REMOVE_TARGET_HEADERS

#the so version (so.11) should match the version of protobuf being built
define PROTOBUF2_SYMLINK_AFTER_INSTALL
	ln -s -f /usr/proto2/lib/libprotobuf-lite.so.9 $(TARGET_DIR)/usr/lib/libprotobuf-lite.so.9
	ln -s -f /usr/proto2/lib/libprotobuf.so.9 $(TARGET_DIR)/usr/lib/libprotobuf.so.9
endef

define PROTOBUF2_REMOVE_TARGET_HEADERS
	rm -rf $(TARGET_DIR)/usr/proto2/include
endef

ifeq ($(BR2_PACKAGE_ZLIB),y)
PROTOBUF2_DEPENDENCIES += zlib
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
