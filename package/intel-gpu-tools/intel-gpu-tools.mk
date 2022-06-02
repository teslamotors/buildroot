################################################################################
#
# intel-gpu-tools
#
################################################################################

INTEL_GPU_TOOLS_VERSION = 1.20
INTEL_GPU_TOOLS_SOURCE = intel-gpu-tools-$(INTEL_GPU_TOOLS_VERSION).tar.bz2
INTEL_GPU_TOOLS_SITE = http://xorg.freedesktop.org/archive/individual/app
INTEL_GPU_TOOLS_INSTALL_STAGING = YES
INTEL_GPU_TOOLS_INSTALL_TARGET = YES
INTEL_GPU_TOOLS_DEPENDENCIES = host-pkgconf libdrm cairo libglib2 libpciaccess libunwind

$(eval $(autotools-package))
