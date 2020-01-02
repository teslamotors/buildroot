################################################################################
#
# qpoases-e
#
################################################################################

QPOASES_E_VERSION = 3.1.1
QPOASES_E_SITE = http://www.coin-or.org/download/source/qpOASES
QPOASES_E_SOURCE = qpOASES_e-$(QPOASES_E_VERSION).zip
QPOASES_E_LICENSE = BSD-2c
QPOASES_E_LICENSE_FILES = LICENSE.txt

QPOASES_E_INSTALL_STAGING = YES

define QPOASES_E_EXTRACT_CMDS
	$(UNZIP) $(DL_DIR)/$(QPOASES_E_SOURCE) -d $(@D)
	mv $(@D)/qpOASES_e-$(QPOASES_E_VERSION)/* $(@D)/
	rmdir $(@D)/qpOASES_e-$(QPOASES_E_VERSION)
	cp $(QPOASES_E_PKGDIR)/Makefile $(@D)/
endef

define QPOASES_E_BUILD_CMDS
	$(MAKE) -C $(@D) all "CC=$(TARGET_CC)" "CFLAGS=$(TARGET_CFLAGS)"
endef

define QPOASES_E_INSTALL_STAGING_CMDS
	cd $(@D) && $(MAKE) install-dev DESTDIR=$(STAGING_DIR)
endef

define QPOASES_E_INSTALL_TARGET_CMDS
	cd $(@D) && $(MAKE) install DESTDIR=$(TARGET_DIR)
endef

$(eval $(generic-package))
