################################################################################
#
# python-asyncio-extras
#
################################################################################

PYTHON_ASYNCIO_EXTRAS_VERSION = 1.3.0
PYTHON_ASYNCIO_EXTRAS_SOURCE = asyncio_extras-$(PYTHON_ASYNCIO_EXTRAS_VERSION).tar.gz
PYTHON_ASYNCIO_EXTRAS_SITE = https://files.pythonhosted.org/packages/f8/8f/5e8cd289b5df6c7000208c3dcbb3fd3454569cb7123646f754dfcf05525b
PYTHON_ASYNCIO_EXTRAS_SETUP_TYPE = setuptools
PYTHON_ASYNCIO_EXTRAS_LICENSE = MIT
PYTHON_ASYNCIO_EXTRAS_LICENSE_FILES = LICENSE
PYTHON_ASYNCIO_EXTRAS_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
