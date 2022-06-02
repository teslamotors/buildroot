################################################################################
#
# khronos-vulkan-loader
#
################################################################################
KHRONOS_VULKAN_LOADER_VERSION = v1.2.184
KHRONOS_VULKAN_LOADER_SITE = https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/$(KHRONOS_VULKAN_LOADER_VERSION).tar.gz
KHRONOS_VULKAN_LOADER_LICENSE = Apache-2.0
KHRONOS_VULKAN_LOADER_INSTALL_STAGING = YES
KHRONOS_VULKAN_LOADER_INSTALL_TARGET = YES
KHRONOS_VULKAN_LOADER_SUPPORTS_IN_SOURCE_BUILD = NO

KHRONOS_VULKAN_LOADER_DEPENDENCIES = \
	mesa3d \
	khronos-vulkan-headers \
	host-khronos-vulkan-loader \
	xlib_libX11 \
	xlib_libXext \
	xlib_libXrandr

KHRONOS_VULKAN_LOADER_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
	-DBUILD_TESTS=OFF \
	-DVULKAN_HEADERS_INSTALL_DIR=$(STAGING_DIR)/usr

HOST_KHRONOS_VULKAN_LOADER_DEPENDENCIES = \
	host-khronos-vulkan-headers

# As part of the build step, Vulkan Loader package will emit an asm_offset tool
# in the package's build directory under `loader/`. This is required to be on
# the PATH in order for the rest of the build to continue. Unfortunately, this
# technically means that asm_offset -- a host-side, build-time tool -- is built
# with the *target* toolchain, which isn't correct. As such, we first build the
# library on the host, and then install asm_offset into the host's /usr/bin for
# use when the target library build is underway.
HOST_KHRONOS_VULKAN_LOADER_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_ASM_COMPILER=$(HOSTCXX) \
	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
	-DBUILD_WSI_XCB_SUPPORT=OFF \
	-DBUILD_WSI_XLIB_SUPPORT=OFF \
	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
	-DBUILD_TESTS=OFF \
	-DVULKAN_HEADERS_INSTALL_DIR=$(HOST_DIR)

# Copy the asm_offset tool into host binaries
define HOST_KHRONOS_VULKAN_LOADER_INSTALL_CMDS
	mkdir -p $(HOST_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/buildroot-build/loader/asm_offset \
		$(HOST_DIR)/usr/bin/asm_offset
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
