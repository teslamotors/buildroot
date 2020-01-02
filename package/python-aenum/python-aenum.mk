################################################################################
#
# python-aenum
#
################################################################################

PYTHON_AENUM_VERSION = 2.0.6
PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/8a/c8/5aa1024f9aa48db1e3c90869dc72a7be778342cda53b7f50b32105f85fdb
PYTHON_AENUM_SETUP_TYPE = setuptools
PYTHON_AENUM_LICENSE = BSD
PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE

define PYTHON_AENUM_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/aenum/doc/*.pdf
endef

PYTHON_AENUM_POST_INSTALL_TARGET_HOOKS += PYTHON_AENUM_INSTALL_TARGET_FIXUP

$(eval $(python-package))
