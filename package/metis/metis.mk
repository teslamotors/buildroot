################################################################################
#
# metis
#
################################################################################

METIS_VERSION = 5.1.0
METIS_SITE = http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis
METIS_LICENSE = Apache-2.0
METIS_LICENSE_FILES = LICENSE.txt
METIS_DEPENDENCIES = host-cmake

METIS_CMAKE_ENV = PATH=$(HOST_DIR)/usr/bin/:$(PATH)

define METIS_CONFIGURE_CMDS
	cd $(@D) && $(METIS_CMAKE_ENV) $(MAKE) shared=1 prefix=$(STAGING_DIR)/usr cc=$(TARGET_CC) config
endef

define METIS_BUILD_CMDS
	cd $(@D) && $(METIS_CMAKE_ENV) $(MAKE)
endef

define METIS_INSTALL_TARGET_CMDS
	cd $(@D) && $(METIS_CMAKE_ENV) $(MAKE) install
endef

$(eval $(generic-package))
