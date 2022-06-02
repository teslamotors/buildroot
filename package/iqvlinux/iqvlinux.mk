################################################################################
#
# iqvlinux
#
################################################################################

IQVLINUX_VERSION = 1.2.0.12
IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)/iqvlinux.tar.gz?
# Force version-specific filenames even though original source uses plain iqvlinux.tar.gz
IQVLINUX_DL_OPTS = -O iqvlinux-$(IQVLINUX_VERSION).tar.gz

IQVLINUX_LICENSE = GPLv2, BSD-3c
IQVLINUX_LICENSE_FILES = \
	COPYING src/linux/driver/files.txt \
	inc/linux/files.txt inc/files.txt

IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) \
			    KERNEL_SRC=$(LINUX_DIR) \
			    KERNEL_VERSION=$(LINUX_VERSION_PROBED) \
			    KERNEL_BUILDDIR=$(LINUX_DIR) \
			    CC=$(TARGET_CC)

IQVLINUX_MODULE_SUBDIRS = src/linux/driver

$(eval $(kernel-module))
$(eval $(generic-package))
