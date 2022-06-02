################################################################################
#
# libpsl
#
################################################################################

LIBPSL_VERSION_MAJOR = 0.21
LIBPSL_VERSION = $(LIBPSL_VERSION_MAJOR).1
LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
LIBPSL_LICENSE = MIT
LIBPSL_LICENSE_FILES = COPYING LICENSE
LIBPSL_INSTALL_STAGING = YES

# Prefer libicu since libidn2 is GPLv3
ifeq ($(BR2_PACKAGE_ICU),y)
LIBPSL_DEPENDENCIES += icu
LIBPSL_CONF_OPTS += \
	-Druntime=libicu \
	-Dbuiltin=libicu
else
LIBPSL_DEPENDENCIES += libidn2 libunistring
LIBPSL_CONF_OPTS += \
	-Druntime=libidn2 \
	-Dbuiltin=libidn2
endif

$(eval $(meson-package))
