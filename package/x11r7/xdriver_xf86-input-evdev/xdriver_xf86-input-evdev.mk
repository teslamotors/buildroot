################################################################################
#
# xdriver_xf86-input-evdev
#
################################################################################

ifeq ($(BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_VERSION_UPSTREAM),y)
XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.6
else ifeq ($(BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_2_7_0),y)
XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.7.0
else ifeq ($(BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_2_3_2),y)
XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.3.2
endif
XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES

XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
	host-pkgconf \
	libevdev \
	mtdev \
	xorgproto \
	xserver_xorg-server \
	udev

$(eval $(autotools-package))
