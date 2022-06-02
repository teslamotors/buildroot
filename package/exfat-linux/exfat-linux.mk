################################################################################
#
# exfat-linux
#
################################################################################

EXFAT_LINUX_VERSION = 5.8-1arter97
EXFAT_LINUX_SITE = $(call github,arter97,exfat-linux,$(EXFAT_LINUX_VERSION))
EXFAT_LINUX_DEPENDENCIES = host-pkgconf
EXFAT_LINUX_LICENSE = GPL-2.0
EXFAT_LINUX_LICENSE_FILES = LICENSE

EXFAT_LINUX_MODULE_MAKE_OPTS = CONFIG_EXFAT_FS=m

$(eval $(kernel-module))
$(eval $(generic-package))
