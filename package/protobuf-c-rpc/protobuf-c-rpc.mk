################################################################################
#
# protobuf-c-rpc
#
################################################################################

PROTOBUF_C_RPC_VERSION = 07fed6de95659e7aa721be93fc7eb3ebb5cc1a07
PROTOBUF_C_RPC_SITE = https://github.com/protobuf-c/protobuf-c-rpc.git
PROTOBUF_C_RPC_SITE_METHOD = git
PROTOBUF_C_RPC_DEPENDENCIES = protobuf-c
PROTOBUF_C_RPC_INSTALL_TARGET = YES
PROTOBUF_C_RPC_INSTALL_STAGING = YES
PROTOBUF_C_LICENSE = BSD-2-Clause
PROTOBUF_C_LICENSE_FILES = LICENSE
PROTOBUF_C_RPC_AUTORECONF = YES

$(eval $(autotools-package))

