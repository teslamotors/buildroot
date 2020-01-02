################################################################################
#
# ureadahead
#
################################################################################

UREADAHEAD_VERSION = 0.100.0
UREADAHEAD_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
UREADAHEAD_SOURCE = ureadahead_$(UREADAHEAD_VERSION).orig.tar.gz
UREADAHEAD_INSTALL_STAGING = YES
UREADAHEAD_LICENSE = GPLv2
UREADAHEAD_LICENSE_FILES = COPYING

UREADAHEAD_DEPENDENCIES = libnih e2fsprogs host-gettext host-bison

$(eval $(autotools-package))
