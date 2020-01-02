################################################################################
#
# python-pluggy
#
################################################################################

PYTHON_PLUGGY_VERSION = 0.8.0
PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/65/25/81d0de17cd00f8ca994a4e74e3c4baf7cd25072c0b831dad5c7d9d6138f8
PYTHON_PLUGGY_SETUP_TYPE = setuptools
PYTHON_PLUGGY_LICENSE = MIT
PYTHON_PLUGGY_LICENSE_FILES = LICENSE

$(eval $(python-package))
