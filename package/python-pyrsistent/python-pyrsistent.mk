################################################################################
#
# python-pyrsistent
#
################################################################################

PYTHON_PYRSISTENT_VERSION = 0.16.0
PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/9f/0d/cbca4d0bbc5671822a59f270e4ce3f2195f8a899c97d0d5abb81b191efb5
PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
PYTHON_PYRSISTENT_LICENSE = MIT
PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit

$(eval $(python-package))
