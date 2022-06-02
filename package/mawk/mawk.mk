################################################################################
#
# mawk
#
################################################################################

MAWK_VERSION = 1.3.4-20200120
MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
MAWK_SITE = ftp://ftp.invisible-island.net/mawk
MAWK_LICENSE = GPL-2.0
MAWK_LICENSE_FILES = COPYING

$(eval $(autotools-package))
