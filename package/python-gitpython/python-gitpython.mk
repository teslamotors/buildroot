################################################################################
#
# python-gitpython
#
################################################################################

PYTHON_GITPYTHON_VERSION = 2.1.1
PYTHON_GITPYTHON_SOURCE = GitPython-$(PYTHON_GITPYTHON_VERSION).tar.gz
PYTHON_GITPYTHON_SITE = https://files.pythonhosted.org/packages/21/13/8d0981cee1c5b9dd7fa9f836ed7c304891686f300572c03a49e52c07c04c
PYTHON_GITPYTHON_SETUP_TYPE = setuptools
PYTHON_GITPYTHON_LICENSE = BSD
PYTHON_GITPYTHON_LICENSE_FILES = LICENSE

$(eval $(python-package))
