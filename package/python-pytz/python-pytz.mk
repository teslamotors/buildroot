################################################################################
#
# python-pytz
#
################################################################################

PYTHON_PYTZ_VERSION = 2020.1
PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/f4/f6/94fee50f4d54f58637d4b9987a1b862aeb6cd969e73623e02c5c00755577
PYTHON_PYTZ_SETUP_TYPE = setuptools
PYTHON_PYTZ_LICENSE = MIT
PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
PYTHON_PYTZ_INSTALL_TARGET_OPTS= -c

$(eval $(python-package))
