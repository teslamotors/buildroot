################################################################################
#
# python-cvxopt
#
################################################################################

PYTHON_CVXOPT_VERSION = 1.1.8
PYTHON_CVXOPT_SOURCE = cvxopt-$(PYTHON_CVXOPT_VERSION).tar.gz
PYTHON_CVXOPT_SITE = https://pypi.python.org/packages/2e/a1/09cae1ac9906ab2de75e19ae7f5619fd010b8cad2b82eb073852045e07ed/cvxopt-1.1.8.tar.gz\#md5=d4ff0a0e51aba93f838a70302a088eea
PYTHON_CVXOPT_LICENSE = GPLv3
PYTHON_CVXOPT_LICENSE_FILES = LICENSE
PYTHON_CVXOPT_SETUP_TYPE = setuptools

PYTHON_CVXOPT_DEPENDENCIES = clapack openblas
PYTHON_CVXOPT_SITE_CFG_LIBS += blas lapack

PYTHON_CVXOPT_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
    $(foreach dep,BLAS GSL FFTW GLPK DSDP SUITESPARSE,CVXOPT_$(dep)_LIB_DIR=$(STAGING_DIR)/usr/lib )

$(eval $(python-package))
