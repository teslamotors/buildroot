################################################################################
#
# tesla-rsync
#
################################################################################

TESLA_RSYNC_VERSION = 2.6.9
TESLA_RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
TESLA_RSYNC_SOURCE = rsync-$(TESLA_RSYNC_VERSION).tar.gz
TESLA_RSYNC_LICENSE = GPLv2
TESLA_RSYNC_LICENSE_FILES = COPYING
TESLA_RSYNC_DEPENDENCIES = zlib popt
TESLA_RSYNC_CONF_OPTS = \
	--with-included-zlib=no \
	--with-included-popt=no

ifeq ($(BR2_PACKAGE_ACL),y)
TESLA_RSYNC_DEPENDENCIES += acl
else
TESLA_RSYNC_CONF_OPTS += --disable-acl-support
endif

$(eval $(autotools-package))
