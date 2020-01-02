################################################################################
#
# python-pytz
#
################################################################################

PYTHON_PYTZ_VERSION = 2017.2
PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).zip
PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519
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
