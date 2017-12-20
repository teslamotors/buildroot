################################################################################
#
# tesla-python-dateutil
#
################################################################################

TESLA_PYTHON_DATEUTIL_VERSION = 2.5.3
TESLA_PYTHON_DATEUTIL_SOURCE = python-dateutil-$(TESLA_PYTHON_DATEUTIL_VERSION).tar.gz
TESLA_PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902
TESLA_PYTHON_DATEUTIL_LICENSE = BSD-3c
TESLA_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
TESLA_PYTHON_DATEUTIL_SETUP_TYPE = distutils

$(eval $(python-package))
