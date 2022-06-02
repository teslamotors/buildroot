################################################################################
#
# xli
#
################################################################################

XLI_VERSION = 2005-02-27
XLI_SITE = https://gentoo.osuosl.org/distfiles/a9
XLI_SOURCE = xli-$(XLI_VERSION).tar.gz
XLI_LICENSE = MIT
XLI_LICENSE_FILES = xli.txt
XLI_DEPENDENCIES = xlib_libX11 xlib_libXext jpeg

XLI_GCCFLAGS = -fstrength-reduce -finline-functions -ljpeg -lpng -lXext
XLI_SYSPATH = /usr/lib/X11
XLI_SYSPATHFILE = $(XLI_SYSPATH)/Xli

define XLI_CONFIGURE_CMDS
	ln -sf Makefile.std $(@D)/Makefile
endef

define XLI_BUILD_CMDS
	$(MAKE) -C $(@D) gcc CC=$(TARGET_CC) GCC=$(TARGET_CC) SYSPATHFILE=$(XLI_SYSPATHFILE) GCCFLAGS="$(XLI_GCCFLAGS)"
endef

define XLI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/$(XLI_SYSPATH)
	$(MAKE) -C $(@D) install SYSPATHFILE=$(TARGET_DIR)/$(XLI_SYSPATHFILE) INSTALLDIR=$(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
