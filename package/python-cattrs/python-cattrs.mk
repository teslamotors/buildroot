################################################################################
#
# python-cattrs
#
################################################################################

PYTHON_CATTRS_VERSION = 1.0.0
PYTHON_CATTRS_SOURCE = cattrs-$(PYTHON_CATTRS_VERSION).tar.gz
PYTHON_CATTRS_SITE = https://files.pythonhosted.org/packages/52/11/5a7b1730daa960228ba970b0b452cbeafbd6fa5c34851210be8e5c30aba9
PYTHON_CATTRS_SETUP_TYPE = setuptools
PYTHON_CATTRS_LICENSE = MIT
PYTHON_CATTRS_LICENSE_FILES = LICENSE

$(eval $(python-package))
