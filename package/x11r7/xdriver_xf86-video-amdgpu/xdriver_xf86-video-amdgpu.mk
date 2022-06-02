################################################################################
#
# xdriver_xf86-video-amdgpu
#
################################################################################

# 19.1.0 + master branch changes through March 2020
XDRIVER_XF86_VIDEO_AMDGPU_VERSION = cb27a5b1120266e4baaa3eb784ff041977ded43f
XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.bz2
XDRIVER_XF86_VIDEO_AMDGPU_SITE = https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/archive/$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION)
XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_AMDGPU_AUTORECONF = YES
XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
	libdrm \
	xlib_libXcomposite \
	xorgproto \
	xserver_xorg-server

# xdriver_xf86-video-amdgpu requires O_CLOEXEC
XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

$(eval $(autotools-package))
