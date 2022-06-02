################################################################################
#
# python-scs
#
################################################################################

PYTHON_SCS_VERSION = 2.1.2
PYTHON_SCS_SOURCE = scs-$(PYTHON_SCS_VERSION).tar.gz
PYTHON_SCS_SITE = https://files.pythonhosted.org/packages/1a/72/33be87cce255d4e9dbbfef547e9fd6ec7ee94d0d0910bb2b13badea3fbbe
PYTHON_SCS_LICENSE = MIT
# There is no license file included in the source bundle.
#PYTHON_SCS_LICENSE_FILES = LICENSE.txt
PYTHON_SCS_SETUP_TYPE = setuptools

PYTHON_SCS_DEPENDENCIES += python-numpy python-scipy
PYTHON_SCS_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ \
    BLAS_LAPACK_LIB_PATHS=$(STAGING_DIR)/usr/lib \
    BLAS_LAPACK_LIBS=openblas:blas:lapack

PYTHON_SCS_BUILD_DIR = $(PYTHON_SCS_SRCDIR)/python

$(eval $(python-package))
