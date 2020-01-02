################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 0.10.3
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/e6/fc/9b3820c47aa66924c38841f1766bf3b4857161b3c53e8548dd7a6dc0b226
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_LICENSE = APACHE2
PYTHON_YARL_LICENSE_FILES = LICENSE

define PYTHON_YARL_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/yarl/*.c
endef

PYTHON_YARL_POST_INSTALL_TARGET_HOOKS += PYTHON_YARL_INSTALL_TARGET_FIXUP

$(eval $(python-package))
