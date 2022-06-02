################################################################################
#
# python-pyparsing
#
################################################################################

PYTHON_PYPARSING_VERSION = 2.4.7
PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210
PYTHON_PYPARSING_LICENSE = MIT
PYTHON_PYPARSING_LICENSE_FILES = LICENSE
PYTHON_PYPARSING_SETUP_TYPE = setuptools

define PYTHON_PYPARSING_EXTRACT_CMDS
	mkdir -p $(@D)
	tar -C $(@D) --strip-components=2 -xzf $(PYTHON_PYPARSING_DL_DIR)/$(PYTHON_PYPARSING_SOURCE)
endef

$(eval $(python-package))
