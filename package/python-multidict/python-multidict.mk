################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 4.5.2
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/7f/8f/b3c8c5b062309e854ce5b726fc101195fbaa881d306ffa5c2ba19efa3af2
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

define PYTHON_MULTIDICT_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*.h
endef

PYTHON_MULTIDICT_POST_INSTALL_TARGET_HOOKS += PYTHON_MULTIDICT_INSTALL_TARGET_FIXUP

$(eval $(python-package))
