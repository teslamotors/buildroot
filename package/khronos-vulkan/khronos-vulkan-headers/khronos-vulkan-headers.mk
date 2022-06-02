################################################################################
#
# khronos-vulkan-loader
#
################################################################################
KHRONOS_VULKAN_HEADERS_VERSION = v1.2.184
KHRONOS_VULKAN_HEADERS_SITE = https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/$(KHRONOS_VULKAN_HEADERS_VERSION).tar.gz
KHRONOS_VULKAN_HEADERS_LICENSE = Apache-2.0
KHRONOS_VULKAN_HEADERS_INSTALL_STAGING = YES
KHRONOS_VULKAN_HEADERS_INSTALL_TARGET = NO
KHRONOS_VULKAN_HEADERS_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
