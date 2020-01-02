################################################################################
#
# protobuf3
#
################################################################################

# When bumping this package, make sure to also verify if the
# python-protobuf package still works, as they share the same
# version/site variables.
PROTOBUF3_VERSION = 3.6.0
PROTOBUF3_SOURCE = protobuf-cpp-$(PROTOBUF3_VERSION).tar.gz
PROTOBUF3_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF3_VERSION)

PROTOBUF3_LICENSE = BSD-3-Clause
PROTOBUF3_LICENSE_FILES = LICENSE
HOST_PROTOBUF3_CONF_OPTS = --prefix=$(HOST_DIR)/usr/proto3/

# N.B. Need to use host protoc during cross compilation.
PROTOBUF3_DEPENDENCIES = host-protobuf3
PROTOBUF3_CONF_OPTS = --prefix=/usr/proto3/ --exec-prefix=/usr/proto3 --with-protoc=$(HOST_DIR)/usr/proto3/bin/protoc

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
PROTOBUF3_CONF_ENV += LIBS=-latomic
endif

PROTOBUF3_INSTALL_STAGING = YES
PROTOBUF3_POST_INSTALL_TARGET_HOOKS += PROTOBUF3_SYMLINK_AFTER_INSTALL PROTOBUF3_REMOVE_TARGET_HEADERS

#the so version (so.16) should match the version of protobuf being built
define PROTOBUF3_SYMLINK_AFTER_INSTALL
        ln -s -f /usr/proto3/lib/libprotobuf-lite.so.16 $(TARGET_DIR)/usr/lib/libprotobuf-lite.so.16
        ln -s -f /usr/proto3/lib/libprotobuf.so.16 $(TARGET_DIR)/usr/lib/libprotobuf.so.16
endef

define PROTOBUF3_REMOVE_TARGET_HEADERS
	rm -rf $(TARGET_DIR)/usr/proto3/include
endef

ifeq ($(BR2_PACKAGE_ZLIB),y)
PROTOBUF3_DEPENDENCIES += zlib
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
