############################################
#
# python-pandas
#
############################################

PYTHON_PANDAS_VERSION = 0.20.3
PYTHON_PANDAS_SOURCE = pandas-$(PYTHON_PANDAS_VERSION).tar.gz
PYTHON_PANDAS_SITE = https://pypi.python.org/packages/ee/aa/90c06f249cf4408fa75135ad0df7d64c09cf74c9870733862491ed5f3a50
PYTHON_PANDAS_LICENSE = BSD-3c
PYTHON_PANDAS_LICENSE_FILES = LICENSE
PYTHON_PANDAS_SETUP_TYPE = distutils
PYTHON_PANDAS_DEPENDENCIES = host-python-numpy python-numpy clapack openblas tesla-python-pytz
PYTHON_PANDAS_SITE_CFG_LIBS += blas lapack

PYTHON_PANDAS_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/

define PYTHON_PANDAS_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
