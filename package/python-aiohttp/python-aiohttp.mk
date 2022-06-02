################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.7.4
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/7a/95/eb60aaad7943e18c9d091de93c9b0b5ed40aa67c7d5e3c5ee9b36f100a38
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp_project
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

define PYTHON_AIOHTTP_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/aiohttp/*.[ch]
endef

PYTHON_AIOHTTP_POST_INSTALL_TARGET_HOOKS += PYTHON_AIOHTTP_INSTALL_TARGET_FIXUP

$(eval $(python-package))

