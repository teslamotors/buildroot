################################################################################
#
# python-gitdb2
#
################################################################################

PYTHON_GITDB2_VERSION = 2.0.0
PYTHON_GITDB2_SOURCE = gitdb2-$(PYTHON_GITDB2_VERSION).tar.gz
PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/5c/bb/ab74c6914e3b570ab2e960fda17a01aec93474426eecd3b34751ba1c3b38
PYTHON_GITDB2_SETUP_TYPE = setuptools
PYTHON_GITDB2_LICENSE = BSD
PYTHON_GITDB2_LICENSE_FILES = LICENSE

$(eval $(python-package))
