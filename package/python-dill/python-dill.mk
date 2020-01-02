################################################################################
#
# python-dill
#
################################################################################

PYTHON_DILL_VERSION = 0.2.6
PYTHON_DILL_SOURCE = dill-$(PYTHON_DILL_VERSION).zip
PYTHON_DILL_SUBDIR = dill-$(PYTHON_DILL_VERSION)
PYTHON_DILL_SITE = https://pypi.python.org/packages/ef/69/0d03d5f9af0e16d41bb47262100b0c4c08f90538c9a5c2de0d44284172ba/dill-0.2.6.zip\#md5=f8b98b15223d23431024349f2102b4f9
PYTHON_DILL_SETUP_TYPE = setuptools
PYTHON_DILL_LICENSE = BSD
PYTHON_DILL_LICENSE_FILES = LICENSE

define PYTHON_DILL_EXTRACT_CMDS
	unzip -o $(PYTHON_DILL_DL_DIR)/$(PYTHON_DILL_SOURCE) -d $(@D)
endef

$(eval $(python-package))
