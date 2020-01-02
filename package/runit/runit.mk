################################################################################
#
# runit
#
################################################################################

RUNIT_VERSION = 2.1.2
RUNIT_SITE = http://smarden.org/runit
RUNIT_STRIP_COMPONENTS = 2
RUNIT_LICENSE = BSD-3c
RUNIT_LICENSE_FILES = package/COPYING

define RUNIT_BUILD_CMDS
	echo $(TARGET_CC) > $(@D)/src/conf-cc
	echo $(TARGET_CC) -s > $(@D)/src/conf-ld
	sed -i -e 's#futmpx.h#utmp.h#g' $(@D)/src/tryuwtmpx.c
	sed -i -e 's#2>/dev/null##g' $(@D)/src/Makefile
	cd $(@D) && export CC=$(TARGET_CC) && export LD="$(TARGET_CC) -s" && $(LOGLINEAR) ./package/compile
endef

ifeq ($(BR2_PACKAGE_RUNIT_INIT),y)
define RUNIT_INSTALL_INIT
if [ ! -e $(TARGET_DIR)/sbin/init ] || [ -L $(TARGET_DIR)/sbin/init ]; then ln -sf /sbin/runit-init $(TARGET_DIR)/sbin/init; fi
endef
endif

define RUNIT_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/runit
	$(INSTALL) -d $(TARGET_DIR)/etc/sv
	$(INSTALL) -d $(TARGET_DIR)/sbin
	$(INSTALL) -d $(TARGET_DIR)/service
	for f in 1 2 3 ctrlaltdel; do $(INSTALL) -m 0700 $(@D)/etc/debian/$$f $(TARGET_DIR)/etc/runit/; done
	for p in $$(cat $(@D)/package/commands); do $(INSTALL) -m 0755 $(@D)/compile/$$p $(TARGET_DIR)/sbin/; done
	$(RUNIT_INSTALL_INIT)
	$(INSTALL) -D -m 0755 $(RUNIT_PKGDIR)/runit-setup-log $(TARGET_DIR)/sbin/runit-setup-log
endef

$(eval $(generic-package))
