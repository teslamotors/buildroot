################################################################################
#
# python-pvlib
#
################################################################################

PYTHON_PVLIB_VERSION = 0.8.1
PYTHON_PVLIB_SOURCE = pvlib-$(PYTHON_PVLIB_VERSION).tar.gz
PYTHON_PVLIB_SITE = https://files.pythonhosted.org/packages/bb/94/a2e96e2a4ed6e6aa92d8a723a3d26a6c9e6d8f4866ff17b496b6d6c7c2c5
PYTHON_PVLIB_SETUP_TYPE = setuptools
PYTHON_PVLIB_LICENSE = BSD-3-Clause
PYTHON_PVLIB_LICENSE_FILES = LICENSE

$(eval $(python-package))
