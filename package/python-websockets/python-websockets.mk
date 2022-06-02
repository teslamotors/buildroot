################################################################################
#
# python-websockets
#
################################################################################

PYTHON_WEBSOCKETS_VERSION = 8.0.2
PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/79/78/17e97a159dc55308b1468a638c7267f19765281f6205ec9c15253c154022
PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE

define PYTHON_WEBSOCKETS_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/websockets/*.c
endef

PYTHON_WEBSOCKETS_POST_INSTALL_TARGET_HOOKS += PYTHON_WEBSOCKETS_INSTALL_TARGET_FIXUP


$(eval $(python-package))
