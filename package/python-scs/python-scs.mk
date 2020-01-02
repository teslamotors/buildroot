################################################################################
#
# python-scs
#
################################################################################

PYTHON_SCS_VERSION = 1.2.6
PYTHON_SCS_SOURCE = scs-$(PYTHON_SCS_VERSION).tar.gz
PYTHON_SCS_SITE = https://pypi.python.org/packages/94/b0/7517c1113c121db1b9cc19a381f28fc915294eaa61f61e0a3502746dfa88/scs-1.2.6.tar.gz\#md5=3eaa04ffa76aaf27dc8a8e608c6a9f12
PYTHON_SCS_LICENSE = MIT
# There is no license file included in the source bundle.
#PYTHON_SCS_LICENSE_FILES = LICENSE.txt
PYTHON_SCS_SETUP_TYPE = setuptools

PYTHON_SCS_DEPENDENCIES += python-numpy
PYTHON_SCS_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
    BLAS_LAPACK_LIB_PATHS=$(STAGING_DIR)/usr/lib \
    BLAS_LAPACK_LIBS=openblas:blas:lapack

PYTHON_SCS_BUILD_DIR = $(PYTHON_SCS_SRCDIR)/python

$(eval $(python-package))
