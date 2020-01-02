############################################
#
# python-pyomo
#
############################################

PYTHON_PYOMO_VERSION = 5.5.1
PYTHON_PYOMO_SITE = $(call github,Pyomo,pyomo,$(PYTHON_PYOMO_VERSION))
PYTHON_PYOMO_SETUP_TYPE = setuptools
PYTHON_PYOMO_LICENSE = BSD
PYTHON_PYOMO_DEPENDENCIES = \
	python-six \
	python-appdirs \
	python-ply \
	python-pyutilib

$(eval $(python-package))
