#################################################################
#
# python-multiprocess
#
#################################################################

PYTHON_MULTIPROCESS_VERSION = 0.70.5
PYTHON_MULTIPROCESS_SOURCE = multiprocess-$(PYTHON_MULTIPROCESS_VERSION).tar.gz
PYTHON_MULTIPROCESS_SITE = https://github.com/uqfoundation/multiprocess/archive
PYTHON_MULTIPROCESS_LICENSE = BSD-3c
PYTHON_MULTIPROCESS_LICENSE_FILES = COPYING.txt
PYTHON_MULTIPROCESS_SETUP_TYPE = setuptools

$(eval $(python-package))
