################################################################################
#
# host-libuuid
#
################################################################################

LIBUUID_VERSION = 1.0.3
LIBUUID_SITE = https://sourceforge.net/projects/libuuid
LIBUUID_LICENSE = BSD-3c
LIBUUID_LICENSE_FILES = COPYING

$(eval $(autotools-package))
$(eval $(host-autotools-package))
