############################################
#
# python-packaging
#
############################################

PYTHON_PACKAGING_VERSION = 16.8
PYTHON_PACKAGING_SITE = $(call github,pypa,packaging,$(PYTHON_PACKAGING_VERSION))
PYTHON_PACKAGING_SETUP_TYPE = setuptools
PYTHON_PACKAGING_LICENSE = BSD
PYTHON_PACKAGING_DEPENDENCIES = \
	python-pyparsing \
	python-six

$(eval $(python-package))
