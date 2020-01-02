################################################################################
#
# libnih
#
################################################################################

LIBNIH_VERSION = 1.0.3
LIBNIH_SITE = https://launchpad.net/libnih/1.0/$(LIBNIH_VERSION)/+download
LIBNIH_SOURCE = libnih-$(LIBNIH_VERSION).tar.gz
LIBNIH_INSTALL_STAGING = YES
LIBNIH_LICENSE = GPLv2
LIBNIH_LICENSE_FILES = COPYING

LIBNIH_DEPENDENCIES = host-libnih dbus host-gettext host-bison
HOST_LIBNIH_DEPENDENCIES = host-dbus

$(eval $(autotools-package))
$(eval $(host-autotools-package))
