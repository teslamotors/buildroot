################################################################################
#
# python-dill
#
################################################################################

PYTHON_DILL_VERSION = 0.3.2
PYTHON_DILL_SOURCE = dill-$(PYTHON_DILL_VERSION).zip
PYTHON_DILL_SUBDIR = dill-$(PYTHON_DILL_VERSION)
PYTHON_DILL_SITE = https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5
PYTHON_DILL_SETUP_TYPE = setuptools
PYTHON_DILL_LICENSE = BSD
PYTHON_DILL_LICENSE_FILES = LICENSE

define PYTHON_DILL_EXTRACT_CMDS
	unzip -o $(PYTHON_DILL_DL_DIR)/$(PYTHON_DILL_SOURCE) -d $(@D)
endef

$(eval $(python-package))
