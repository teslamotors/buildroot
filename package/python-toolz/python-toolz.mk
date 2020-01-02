################################################################################
#
# python-toolz
#
################################################################################

PYTHON_TOOLZ_VERSION = 0.8.2
PYTHON_TOOLZ_SOURCE = toolz-$(PYTHON_TOOLZ_VERSION).tar.gz
PYTHON_TOOLZ_SITE = https://pypi.python.org/packages/75/9c/a26de5efd56009e15af607bff6d2a395631e3c20e7c64b861c9bc4b34288/toolz-0.8.2.tar.gz\#md5=7e548980f4959660ff1a921ca86d0beb
PYTHON_TOOL_LICENSE = BSD-3c
PYTHON_TOOLZ_LICENSE_FILES = LICENSE.txt
PYTHON_TOOLZ_SETUP_TYPE = setuptools

$(eval $(python-package))
