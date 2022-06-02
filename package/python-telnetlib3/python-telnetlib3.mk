################################################################################
#
# python-telnetlib3
#
################################################################################

PYTHON_TELNETLIB3_VERSION = 1.0.4
PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/64/bd/5af3f317beeb103c5dccc5d3768ffb31034637f9a5573f83165e9e7a9ab2/telnetlib3-1.0.4.tar.gz
PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
PYTHON_TELNETLIB3_LICENSE = ISC
PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
