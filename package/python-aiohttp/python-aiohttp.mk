################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 2.1.0
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/cf/4a/bec3705f07294d9a4057fe5abd93ca89f52149931301674e1e6a9dd66366
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt

define PYTHON_AIOHTTP_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/aiohttp/*.[ch]
endef

PYTHON_AIOHTTP_POST_INSTALL_TARGET_HOOKS += PYTHON_AIOHTTP_INSTALL_TARGET_FIXUP

$(eval $(python-package))

