################################################################################
#
# shadow
#
################################################################################

SHADOW_VERSION = 4.8.1
SHADOW_SITE = $(call github,shadow-maint,shadow,$(SHADOW_VERSION))
SHADOW_LICENSE = Artistic
SHADOW_LICENSE_FILES = COPYING
SHADOW_AUTORECONF = YES
SHADOW_GETTEXTIZE = YES
SHADOW_CONF_OPTS = --disable-man --with-libpam=no

$(eval $(autotools-package))
