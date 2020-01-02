################################################################################
#
# python-pypng
#
################################################################################

PYTHON_PYPNG_VERSION = 0.0.18
PYTHON_PYPNG_SOURCE = pypng-$(PYTHON_PYPNG_VERSION).tar.gz
PYTHON_PYPNG_SITE = https://files.pythonhosted.org/packages/2f/b1/c8dfcf50feb12a30be7d95c5f45d638704682487d8e50419ef41463febcd
PYTHON_PYPNG_SETUP_TYPE = setuptools
PYTHON_PYPNG_LICENSE = MIT

$(eval $(python-package))
