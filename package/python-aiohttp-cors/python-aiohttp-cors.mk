################################################################################
#
# python-aiohttp-cors
#
################################################################################

PYTHON_AIOHTTP_CORS_VERSION = 0.5.3
PYTHON_AIOHTTP_CORS_SOURCE = aiohttp-cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/33/3c/bcbe3996731ccc8ca3e2db6ca717ba03294a650b3ce5dd4bcc1db9b33632
PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_CORS_LICENSE = APACHE2
PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE

$(eval $(python-package))
