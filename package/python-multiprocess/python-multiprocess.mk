#################################################################
#
# python-multiprocess
#
#################################################################

PYTHON_MULTIPROCESS_VERSION = 0.70.4
PYTHON_MULTIPROCESS_SOURCE = multiprocess-$(PYTHON_MULTIPROCESS_VERSION).tgz
PYTHON_MULTIPROCESS_SITE = https://pypi.python.org/packages/0b/24/21184ba071263e99655452680943701e5aeb4ac7c25bd8691b150aef64c4
PYTHON_MULTIPROCESS_LICENSE = BSD-3c
PYTHON_MULTIPROCESS_LICENSE_FILES = COPYING.txt
PYTHON_MULTIPROCESS_SETUP_TYPE = setuptools

$(eval $(python-package))
