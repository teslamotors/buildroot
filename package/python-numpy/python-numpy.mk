################################################################################
#
# python-numpy
#
################################################################################

PYTHON_NUMPY_VERSION = 1.12.1
PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
PYTHON_NUMPY_LICENSE = BSD-3-Clause
PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
PYTHON_NUMPY_SETUP_TYPE = setuptools

ifeq ($(BR2_PACKAGE_CLAPACK),y)
PYTHON_NUMPY_DEPENDENCIES += clapack openblas
PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack openblas
else
PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
endif

PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
HOST_PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None

define PYTHON_NUMPY_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_NUMPY_SITE_CFG_LIBS)) >> $(@D)/site.cfg
endef

define HOST_PYTHON_NUMPY_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(HOST_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(HOST_DIR)/usr/include" >> $(@D)/site.cfg
endef

# Some package may include few headers from NumPy, so let's install it
# in the staging area.
PYTHON_NUMPY_INSTALL_STAGING = YES

define PYTHON_NUMPY_COPY_HOST_LIBS_TO_STAGING
	# This is gross.  SciPy and pandas use numpy's modified distutils, and importing
	# numpy.distutils eventually imports all of numpy.  That means that host-compiled
	# binaries must be in PYTHONPATH during the build, but the .py files in PYTHONPATH
	# must be from the target or else numpy's build system will force a host build.
	cd $(HOST_DIR) && find usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy -name '*.so' | cpio -pmlud $(STAGING_DIR)/
endef

PYTHON_NUMPY_POST_INSTALL_TARGET_HOOKS += PYTHON_NUMPY_COPY_HOST_LIBS_TO_STAGING

$(eval $(python-package))
$(eval $(host-python-package))
