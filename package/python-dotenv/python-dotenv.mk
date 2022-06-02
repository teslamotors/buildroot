################################################################################
#
# python-dotenv
#
################################################################################

PYTHON_DOTENV_VERSION = 0.19.2
PYTHON_DOTENV_SOURCE = python-dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/49/62/4f25667e10561303a34cb89e3187c35985c0889b99f6f1468aaf17fbb03e
PYTHON_DOTENV_SETUP_TYPE = setuptools
PYTHON_DOTENV_LICENSE = BSD
PYTHON_DOTENV_LICENSE_FILES = LICENSE

$(eval $(python-package))
