################################################################################
#
# python-toolz
#
################################################################################

PYTHON_TOOLZ_VERSION = 0.10.0
PYTHON_TOOLZ_SOURCE = toolz-$(PYTHON_TOOLZ_VERSION).tar.gz
PYTHON_TOOLZ_SITE = https://files.pythonhosted.org/packages/22/8e/037b9ba5c6a5739ef0dcde60578c64d49f45f64c5e5e886531bfbc39157f
PYTHON_TOOL_LICENSE = BSD-3c
PYTHON_TOOLZ_LICENSE_FILES = LICENSE.txt
PYTHON_TOOLZ_SETUP_TYPE = setuptools

$(eval $(python-package))
