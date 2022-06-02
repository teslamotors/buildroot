################################################################################
#
# libsoup
#
################################################################################

LIBSOUP_VERSION_MAJOR = 2.72
LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
LIBSOUP_LICENSE = LGPL-2.0+
LIBSOUP_LICENSE_FILES = COPYING
LIBSOUP_CPE_ID_VENDOR = gnome
LIBSOUP_INSTALL_STAGING = YES
LIBSOUP_DEPENDENCIES = \
	host-pkgconf \
	host-libglib2 \
	host-intltool \
	libglib2 \
	libpsl \
	libxml2 \
	sqlite

LIBSOUP_CONF_OPTS = \
	-Dgssapi=disabled \
	-Dvapi=disabled \
	-Dtests=false \
	-Dtls_check=false \
	-Dsysprof=disabled \
	-Dintrospection=disabled

ifeq ($(BR2_PACKAGE_BROTLI),y)
LIBSOUP_DEPENDENCIES += brotli
LIBSOUP_CONF_OPTS += -Dbrotli=enabled
else
LIBSOUP_CONF_OPTS += -Dbrotli=disabled
endif

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
LIBSOUP_CONF_OPTS += -Dintrospection=enabled
LIBSOUP_DEPENDENCIES += gobject-introspection
else
LIBSOUP_CONF_OPTS += -Dintrospection=disabled
endif

ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
LIBSOUP_CONF_OPTS += -Dgnome=true
else
LIBSOUP_CONF_OPTS += -Dgnome=false
endif

ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
LIBSOUP_DEPENDENCIES += glib-networking
endif

$(eval $(meson-package))
