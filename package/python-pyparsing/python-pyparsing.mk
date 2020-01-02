################################################################################
#
# python-pyparsing
#
################################################################################

PYTHON_PYPARSING_VERSION = 2.2.0
PYTHON_PYPARSING_SOURCE = pyparsing_$(PYTHON_PYPARSING_VERSION).tar.gz
PYTHON_PYPARSING_SITE = https://github.com/pyparsing/pyparsing/archive
PYTHON_PYPARSING_LICENSE = MIT
PYTHON_PYPARSING_LICENSE_FILES = LICENSE
PYTHON_PYPARSING_SETUP_TYPE = setuptools

define PYTHON_PYPARSING_EXTRACT_CMDS
	mkdir -p $(@D)
	tar -C $(@D) --strip-components=2 -xzf $(PYTHON_PYPARSING_DL_DIR)/$(PYTHON_PYPARSING_SOURCE)
endef

$(eval $(python-package))
