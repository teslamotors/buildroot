################################################################################
#
# lzma
#
################################################################################

LZMA_VERSION = 4.32.7
LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
LZMA_SITE = http://tukaani.org/lzma

HOST_LZMA_CONF_OPTS += as_ln_s="ln -sf"

# xz and lzma both provide lzless, so one needs to depend on the other to avoid
# races.
HOST_LZMA_DEPENDENCIES += host-xz
LZMA_DEPENDENCIES += $(if $(BR2_PACKAGE_XZ),xz)

$(eval $(host-autotools-package))

LZMA = $(HOST_DIR)/bin/lzma
