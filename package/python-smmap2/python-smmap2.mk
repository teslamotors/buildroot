################################################################################
#
# python-smmap2
#
################################################################################

PYTHON_SMMAP2_VERSION = 2.0.1
PYTHON_SMMAP2_SOURCE = smmap2-$(PYTHON_SMMAP2_VERSION).tar.gz
PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/83/ce/e5b3aee7ca420b0ab24d4fcc2aa577f7aa6ea7e9306fafceabee3e8e4703
PYTHON_SMMAP2_SETUP_TYPE = setuptools
PYTHON_SMMAP2_LICENSE = BSD

$(eval $(python-package))
