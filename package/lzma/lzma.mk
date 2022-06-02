################################################################################
#
# lzma
#
################################################################################

LZMA_VERSION = 4.32.7
LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
LZMA_SITE = http://tukaani.org/lzma
LZMA_LICENSE = LGPL-2.1+ (lzmadec library, lzmainfo, LzmaDecode), GPL-2.0+ (lzma program, lzgrep and lzmore scripts), GPL-3.0+ (tests)
LZMA_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1

HOST_LZMA_CONF_OPTS += as_ln_s="ln -sf"

# xz and lzma both provide lzless, so one needs to depend on the other to avoid
# races.
HOST_LZMA_DEPENDENCIES += host-xz
LZMA_DEPENDENCIES += $(if $(BR2_PACKAGE_XZ),xz)

$(eval $(host-autotools-package))

LZMA = $(HOST_DIR)/bin/lzma
