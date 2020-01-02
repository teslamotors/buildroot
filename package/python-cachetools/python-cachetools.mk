################################################################################
#
# python-cachetools
#
################################################################################

PYTHON_CACHETOOLS_VERSION = 2.0.0
PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/dc/64/16cbf95e0ac473503c5dcd61aefbbab9f12e1875f40a0aaff566a1236ac4
PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
PYTHON_CACHETOOLS_LICENSE = MIT
PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE

$(eval $(python-package))
