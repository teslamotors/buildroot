################################################################################
#
# python-zope-interface
#
################################################################################

PYTHON_ZOPE_INTERFACE_VERSION = 4.6.0
PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/4e/d0/c9d16bd5b38de44a20c6dc5d5ed80a49626fafcb3db9f9efdc2a19026db6
PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt

define PYTHON_ZOPE_INTERFACE_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/zope/interface/*.c
endef

PYTHON_ZOPE_INTERFACE_POST_INSTALL_TARGET_HOOKS += PYTHON_ZOPE_INTERFACE_INSTALL_TARGET_FIXUP

$(eval $(python-package))
