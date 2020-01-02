################################################################################
#
# glibmm
#
################################################################################

GLIBMM_VERSION_MAJOR = 2.56
GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
GLIBMM_LICENSE_FILES = COPYING COPYING.tools
GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
GLIBMM_INSTALL_STAGING = YES
GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf

define GLIBMM_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/glibmm-*
	rm -rf $(TARGET_DIR)/usr/lib/giomm-*
endef

GLIBMM_POST_INSTALL_TARGET_HOOKS += GLIBMM_INSTALL_TARGET_FIXUP

$(eval $(autotools-package))
