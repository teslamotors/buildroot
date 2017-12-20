################################################################################
#
# tesla-which
#
################################################################################

TESLA_WHICH_VERSION = 2.17
TESLA_WHICH_SITE = $(BR2_GNU_MIRROR)/which
TESLA_WHICH_SOURCE = which-$(TESLA_WHICH_VERSION).tar.gz
TESLA_WHICH_LICENSE = GPLv2
TESLA_WHICH_LICENSE_FILES = COPYING

$(eval $(autotools-package))
