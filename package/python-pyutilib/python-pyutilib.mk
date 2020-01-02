############################################
#
# python-pyutilib
#
############################################

PYTHON_PYUTILIB_VERSION = 5.6.3
PYTHON_PYUTILIB_SITE = $(call github,Pyutilib,pyutilib,$(PYTHON_PYUTILIB_VERSION))
PYTHON_PYUTILIB_SETUP_TYPE = setuptools
PYTHON_PYUTILIB_LICENSE = BSD
PYTHON_PYUTILIB_DEPENDENCIES = \
	python-six \
	python-nose

$(eval $(python-package))
