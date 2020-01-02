################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = v0.19.1
# The github version requires cython to compile. Since we don't want to deal with cross-compiling, use the distributed version instead
#PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/52/67/d9ef9b5058d4a9e3f0ae641ec151790622cbeb37f157de5773358e2bf3da
PYTHON_SCIPY_SITE = $(call github,scipy,scipy,$(PYTHON_SCIPY_VERSION))
PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_LICENSE = BSD
PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools
PYTHON_SCIPY_DEPENDENCIES = host-python-numpy python-numpy clapack openblas host-python-cython
PYTHON_SCIPY_SITE_CFG_LIBS += blas lapack openblas

PYTHON_SCIPY_BUILD_OPTS = --fcompiler=gnu95
PYTHON_SCIPY_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
    CCSHARED="$(TARGET_CC) $(TARGET_CFLAGS)" \
    LDFLAGS="$(TARGET_LDFLAGS) -shared" \
    LDSHARED="$(TARGET_CROSS)gcc"

define PYTHON_SCIPY_CONFIGURE_CMDS
	-rm -f $(@D)/setup.cfg
	echo "[config_fc]" >> $(@D)/setup.cfg
	echo "f77exec = $(TARGET_FC)" >> $(@D)/setup.cfg
	echo "f90exec = $(TARGET_FC)" >> $(@D)/setup.cfg

	-rm -f $(@D)/site.cfg
	echo "[ALL]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
	echo "[openblas]" >> $(@D)/site.cfg
	echo "libraries = openblas" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg

	echo "[variables]" >> $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ -name 'npymath.ini'); 
	echo "pkgdir =  $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core" >> $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ -name 'npymath.ini'); 

endef

$(eval $(python-package))
