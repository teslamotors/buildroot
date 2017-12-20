################################################################################
#
# protobuf3
#
################################################################################

PROTOBUF3_VERSION = v3.1.0
PROTOBUF3_SITE = https://internal-server/internal-repo
PROTOBUF3_SITE_METHOD = git
PROTOBUF3_LICENSE = BSD-3c
PROTOBUF3_LICENSE_FILES = LICENSE
PROTOBUF3_AUTORECONF = YES
HOST_PROTOBUF3_CONF_OPTS = --prefix=$(HOST_DIR)/usr/proto3/

# N.B. Need to use host protoc during cross compilation.
PROTOBUF3_DEPENDENCIES = host-protobuf3
PROTOBUF3_CONF_OPTS = --prefix=/usr/proto3/ --exec-prefix=/usr/proto3 --with-protoc=$(HOST_DIR)/usr/proto3/bin/protoc

PROTOBUF3_INSTALL_STAGING = YES
PROTOBUF3_POST_INSTALL_TARGET_HOOKS += PROTOBUF3_SYMLINK_AFTER_INSTALL

#the so version (so.11) should match the version of protobuf being built
define PROTOBUF3_SYMLINK_AFTER_INSTALL
        ln -s -f /usr/proto3/lib/libprotobuf-lite.so.11 $(TARGET_DIR)/usr/lib/libprotobuf-lite.so.11
        ln -s -f /usr/proto3/lib/libprotobuf.so.11 $(TARGET_DIR)/usr/lib/libprotobuf.so.11
endef


ifeq ($(BR2_PACKAGE_ZLIB),y)
PROTOBUF3_DEPENDENCIES += zlib
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
