################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = 0.18.0
# Github download URL is broken WRT this package.  It was manually downloaded from the below and
# copied to the tarball server.  What is broken is that the released source tarball is not the
# actual release from SciPy -- it is simply the bundled git repo at that tag without the dist files.
#PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/archive/v$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_LICENSE = BSD
PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools
PYTHON_SCIPY_DEPENDENCIES = host-python-numpy python-numpy clapack openblas
PYTHON_SCIPY_SITE_CFG_LIBS += blas lapack

PYTHON_SCIPY_BUILD_OPTS = --fcompiler=gnu95
PYTHON_SCIPY_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
    CCSHARED="$(TARGET_CC) $(TARGET_CFLAGS)" \
    LDFLAGS="$(TARGET_LDFLAGS) -shared" \
    LDSHARED="$(TARGET_CROSS)gcc"

define PYTHON_SCIPY_CONFIGURE_CMDS
	# This is gross.  SciPy uses numpy's modified distutils, and importing numpy.distutils
	# eventually imports all of numpy.  That means that host-compiled binaries must be in
	# PYTHONPATH during the build, but the .py files in PYTHONPATH must be from the target
	# or else numpy's build system will force a host build.
	cd $(HOST_DIR) && \
	    for f in $$(find usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy -name '*.so'); do \
	        cp $$f $(STAGING_DIR)/$$f; \
	    done

	-rm -f $(@D)/setup.cfg
	echo "[global]" >> $(@D)/setup.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/setup.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/setup.cfg
	echo "[config_fc]" >> $(@D)/setup.cfg
	echo "f77exec = $(TARGET_FC)" >> $(@D)/setup.cfg
	echo "f90exec = $(TARGET_FC)" >> $(@D)/setup.cfg

	echo "[variables]" >> $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ -name 'npymath.ini'); 
	echo "pkgdir =  $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core" >> $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ -name 'npymath.ini'); 

endef

$(eval $(python-package))
