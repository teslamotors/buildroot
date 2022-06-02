################################################################################
#
# python-dataclasses
#
################################################################################

PYTHON_DATACLASSES_VERSION = 0.8
PYTHON_DATACLASSES_SOURCE = dataclasses-$(PYTHON_DATACLASSES_VERSION).tar.gz
PYTHON_DATACLASSES_SITE = https://files.pythonhosted.org/packages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae18766d93c59fe5
PYTHON_DATACLASSES_SETUP_TYPE = setuptools
PYTHON_DATACLASSES_LICENSE = Apache-2.0
PYTHON_DATACLASSES_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
