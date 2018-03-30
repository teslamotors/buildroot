################################################################################
#
# netbsd-queue
#
################################################################################

NETBSD_QUEUE_VERSION = 1.70
NETBSD_QUEUE_SITE_METHOD = local
NETBSD_QUEUE_SITE = $(shell readlink -f $(NETBSD_QUEUE_PKGDIR))
NETBSD_QUEUE_LICENSE = BSD-3c

NETBSD_QUEUE_ADD_TOOLCHAIN_DEPENDENCY = NO
NETBSD_QUEUE_INSTALL_STAGING = YES

define NETBSD_QUEUE_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/queue.h \
		$(STAGING_DIR)/usr/include/sys/queue.h
endef

$(eval $(generic-package))
