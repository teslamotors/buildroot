################################################################################
#
# host-tesla-binutils
#
################################################################################

TESLA_BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
ifeq ($(TESLA_BINUTILS_VERSION),)
TESLA_BINUTILS_VERSION = 2.27
endif
ifeq ($(BINUTILS_SITE),)
TESLA_BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
else
TESLA_BINUTILS_SITE = $(BINUTILS_SITE)
endif
ifeq ($(BINUTILS_SOURCE),)
TESLA_BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
else
TESLA_BINUTILS_SOURCE = $(BINUTILS_SOURCE)
endif
TESLA_BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
TESLA_BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB

HOST_TESLA_BINUTILS_CONF_OPTS = \
	--disable-multilib \
	--disable-werror \
	--enable-install-libbfd

define HOST_TESLA_BINUTILS_INSTALL_CMDS
	$(MAKE) -C $(@D)/bfd install
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
