################################################################################
#
# smartmontools
#
################################################################################

SMARTMONTOOLS_VERSION = 7.2
SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
SMARTMONTOOLS_LICENSE = GPL-2.0+
SMARTMONTOOLS_LICENSE_FILES = COPYING
SMARTMONTOOLS_CPE_ID_VENDOR = smartmontools
# We're patching configure.ac
SMARTMONTOOLS_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
SMARTMONTOOLS_DEPENDENCIES += libcap-ng
else
SMARTMONTOOLS_CONF_OPTS += --without-libcap-ng
endif

ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
SMARTMONTOOLS_CONF_OPTS += --with-selinux
SMARTMONTOOLS_DEPENDENCIES += libselinux
else
SMARTMONTOOLS_CONF_OPTS += --without-selinux
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
SMARTMONTOOLS_CONF_OPTS += --with-libsystemd
SMARTMONTOOLS_DEPENDENCIES += systemd
else
SMARTMONTOOLS_CONF_OPTS += --without-libsystemd
endif

define SMARTMONTOOLS_REMOVE_UNNEEDED_FILES
	$(RM) $(TARGET_DIR)/usr/share/smartmontools/drivedb.h
	$(RM) -r $(TARGET_DIR)/usr/share/smartmontools
	$(RM) $(TARGET_DIR)/usr/sbin/update-smart-drivedb
	$(RM) $(TARGET_DIR)/usr/sbin/smartd
	$(RM) $(TARGET_DIR)/etc/smartd_warning.sh
	$(RM) $(TARGET_DIR)/etc/smartd.conf
	$(RM) -r $(TARGET_DIR)/etc/smartd_warning.d
endef

SMARTMONTOOLS_POST_INSTALL_TARGET_HOOKS += SMARTMONTOOLS_REMOVE_UNNEEDED_FILES

$(eval $(autotools-package))
