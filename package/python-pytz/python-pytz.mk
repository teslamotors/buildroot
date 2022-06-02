################################################################################
#
# python-pytz
#
################################################################################

PYTHON_PYTZ_VERSION = 2019.3
PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/82/c3/534ddba230bd4fbbd3b7a3d35f3341d014cca213f369a9940925e7e5f691
PYTHON_PYTZ_SETUP_TYPE = setuptools
PYTHON_PYTZ_LICENSE = MIT
PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
PYTHON_PYTZ_INSTALL_TARGET_OPTS= -c

define PYTHON_PYTZ_EXTRACT_CMDS
    unzip -qq -o $(PYTHON_PYTZ_DL_DIR)/$(PYTHON_PYTZ_SOURCE) -d $(@D)
	mv $(@D)/pytz-$(PYTHON_PYTZ_VERSION)/* $(@D)
	rm -r $(@D)/pytz-$(PYTHON_PYTZ_VERSION)
endef

$(eval $(python-package))
