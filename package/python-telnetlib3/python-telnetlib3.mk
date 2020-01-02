################################################################################
#
# python-telnetlib3
#
################################################################################

PYTHON_TELNETLIB3_VERSION = 1.0.0
PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/e0/41/ead26e2b21606345d04e64f0bb307c325c93c1e9a2a37d3318048b3127a2
PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
PYTHON_TELNETLIB3_LICENSE = ISC
PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
