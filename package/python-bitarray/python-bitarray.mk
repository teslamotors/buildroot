################################################################################
#
# python-bitarray
#
################################################################################

PYTHON_BITARRAY_VERSION = 0.8.1
PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/0a/da/9f61d28a20c42b4963334efacfd257c85150ede96d0cd2509b37da69da47
PYTHON_BITARRAY_SETUP_TYPE = setuptools
PYTHON_BITARRAY_LICENSE = PSF
PYTHON_BITARRAY_LICENSE_FILES = LICENSE

$(eval $(python-package))
