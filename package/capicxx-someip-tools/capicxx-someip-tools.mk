################################################################################
#
# capicxx-someip-tools
#
################################################################################

HOST_CAPICXX_SOMEIP_TOOLS_VERSION = 3.1.10

HOST_CAPICXX_SOMEIP_TOOLS_SITE = $(call github,GENIVI,capicxx-someip-tools,$(CAPICXX_SOMEIP_TOOLS_VERSION))
HOST_CAPICXX_SOMEIP_TOOLS_INSTALL_STAGING = YES
HOST_CAPICXX_SOMEIP_TOOLS_LICENSE = Mozilla2.0
HOST_CAPICXX_SOMEIP_TOOLS_LICENSE_FILES = LICENSE
HOST_CAPICXX_SOMEIP_TOOLS_DEPENDENCIES = host-capicxx-core-tools

define HOST_CAPICXX_SOMEIP_TOOLS_BUILD_CMDS
        cd $(@D)/org.genivi.commonapi.someip.releng && mvn -DCOREPATH=$(HOST_CAPICXX_CORE_TOOLS_DIR) -Dtarget.id=org.genivi.commonapi.someip.target clean verify
endef

define HOST_CAPICXX_SOMEIP_TOOLS_INSTALL_CMDS
        rm -rf $(HOST_DIR)/commonapi-someip
        mkdir -p $(HOST_DIR)/commonapi-someip
        unzip -x $(@D)/org.genivi.commonapi.someip.cli.product/target/products/commonapi_someip_generator.zip -d $(HOST_DIR)/commonapi-someip
endef

$(eval $(host-generic-package))
