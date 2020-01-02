################################################################################
#
# libmicrohttpd
#
################################################################################

LIBMICROHTTPD_VERSION = 0.9.62
LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
LIBMICROHTTPD_LICENSE_FILES = COPYING
LIBMICROHTTPD_INSTALL_STAGING = YES
LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples --disable-doc
LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99

LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
LIBMICROHTTPD_LICENSE = LGPL-2.1+
LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
else
LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
LIBMICROHTTPD_CONF_OPTS += --disable-https
endif

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_EPOLL),n)
LIBMICROHTTPD_CONF_OPTS += --disable-epoll
endif

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_HTTP_BASIC_AUTH),n)
LIBMICROHTTPD_CONF_OPTS += --disable-bauth
endif

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_HTTP_DIGEST_AUTH),n)
LIBMICROHTTPD_CONF_OPTS += --disable-dauth
endif

ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_HTTP_UPGRADE),n)
LIBMICROHTTPD_CONF_OPTS += --disable-httpupgrade
endif

$(eval $(autotools-package))
