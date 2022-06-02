################################################################################
#
# python-twisted
#
################################################################################

PYTHON_TWISTED_VERSION = 20.3.0
PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be2ec0abc779b7d5f9d5f24b17b0349e23240cfc9dc3bd83cc
PYTHON_TWISTED_SETUP_TYPE = setuptools
PYTHON_TWISTED_LICENSE = MIT
PYTHON_TWISTED_LICENSE_FILES = LICENSE
PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental

define PYTHON_TWISTED_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/twisted/internet/iocpreactor/iocpsupport/*.h
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/twisted/internet/iocpreactor/iocpsupport/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/twisted/python/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/twisted/runner/*.c
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/twisted/trial
	find $(TARGET_DIR)/usr/lib/python*/site-packages/twisted -type d -name test -exec rm -rf '{}' \+
endef

PYTHON_TWISTED_POST_INSTALL_TARGET_HOOKS += PYTHON_TWISTED_INSTALL_TARGET_FIXUP

$(eval $(python-package))
