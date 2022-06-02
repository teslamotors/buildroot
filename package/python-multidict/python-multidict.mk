################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 5.0.2
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/da/e6/50c7f52781f45c2b37c77e962c30a3944a9e79a46ea92956e826c24d3432
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

define PYTHON_MULTIDICT_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*.h
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/multidict/*/*.h
endef

PYTHON_MULTIDICT_POST_INSTALL_TARGET_HOOKS += PYTHON_MULTIDICT_INSTALL_TARGET_FIXUP

$(eval $(python-package))
