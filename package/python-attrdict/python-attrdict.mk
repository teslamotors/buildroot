################################################################################
#
# python-attrdict
#
################################################################################

PYTHON_ATTRDICT_VERSION = 2.0.0
PYTHON_ATTRDICT_SOURCE = attrdict-$(PYTHON_ATTRDICT_VERSION).tar.gz
PYTHON_ATTRDICT_SITE = https://files.pythonhosted.org/packages/35/bb/bac3e42ae04bc082c28cd8186bfb5b50fb240a4f7419f876c683125ccc8b
PYTHON_ATTRDICT_SETUP_TYPE = setuptools
PYTHON_ATTRDICT_LICENSE = MIT
PYTHON_ATTRDICT_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
