################################################################################
#
# python-pbr
#
################################################################################

PYTHON_PBR_VERSION = 5.1.1
PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/33/07/6e68a96ff240a0e7bb1f6e21093532386a98a82d56512e1e3da6d125f7aa
PYTHON_PBR_SETUP_TYPE = setuptools
PYTHON_PBR_LICENSE = Apache-2.0
PYTHON_PBR_LICENSE_FILES = LICENSE

define PYTHON_PBR_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pbr/tests/testpackage/src/testext.c
endef

PYTHON_PBR_POST_INSTALL_TARGET_HOOKS += PYTHON_PBR_INSTALL_TARGET_FIXUP

$(eval $(python-package))
$(eval $(host-python-package))
