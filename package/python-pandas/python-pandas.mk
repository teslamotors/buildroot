############################################
#
# python-pandas
#
############################################

PYTHON_PANDAS_VERSION = v1.1.5
#PYTHON_PANDAS_SOURCE = pandas-$(PYTHON_PANDAS_VERSION).tar.gz
PYTHON_PANDAS_SITE = $(call github,pandas-dev,pandas,$(PYTHON_PANDAS_VERSION))
PYTHON_PANDAS_LICENSE = BSD-3c
PYTHON_PANDAS_LICENSE_FILES = LICENSE
PYTHON_PANDAS_SETUP_TYPE = distutils
PYTHON_PANDAS_DEPENDENCIES = host-python-numpy python-numpy clapack openblas python-pytz python-dateutil
PYTHON_PANDAS_SITE_CFG_LIBS += blas lapack

$(eval $(python-package))
