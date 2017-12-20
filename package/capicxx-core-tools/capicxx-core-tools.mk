################################################################################
#
# capicxx-core-tools
#
################################################################################

HOST_CAPICXX_CORE_TOOLS_VERSION = 3.1.10.2

HOST_CAPICXX_CORE_TOOLS_SITE = $(call github,GENIVI,capicxx-core-tools,$(CAPICXX_CORE_TOOLS_VERSION))
HOST_CAPICXX_CORE_TOOLS_INSTALL_STAGING = YES
HOST_CAPICXX_CORE_TOOLS_INSTALL_TARGET = NO
HOST_CAPICXX_CORE_TOOLS_LICENSE = Mozilla2.0
HOST_CAPICXX_CORE_TOOLS_LICENSE_FILES = LICENSE

define HOST_CAPICXX_CORE_TOOLS_BUILD_CMDS
        cd $(@D)/org.genivi.commonapi.core.releng && mvn -Dtarget.id=org.genivi.commonapi.core.target clean verify
endef

define HOST_CAPICXX_CORE_TOOLS_INSTALL_CMDS
        rm -rf $(HOST_DIR)/commonapi-core
        mkdir -p $(HOST_DIR)/commonapi-core
        unzip -x $(@D)/org.genivi.commonapi.core.cli.product/target/products/commonapi-generator.zip -d $(HOST_DIR)/commonapi-core
endef

$(eval $(host-generic-package))
