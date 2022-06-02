################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.6.3
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_LICENSE = APACHE2
PYTHON_YARL_LICENSE_FILES = LICENSE

define PYTHON_YARL_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/yarl/*.c
endef

PYTHON_YARL_POST_INSTALL_TARGET_HOOKS += PYTHON_YARL_INSTALL_TARGET_FIXUP

$(eval $(python-package))
