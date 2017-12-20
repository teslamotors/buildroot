############################################
#
# python-cvxpy
#
############################################

PYTHON_CVXPY_VERSION = 0.4.10
PYTHON_CVXPY_SOURCE = cvxpy-$(PYTHON_CVXPY_VERSION).tar.gz
PYTHON_CVXPY_SITE = https://pypi.python.org/packages/a6/d5/bfc8f7d428d98ac5ceec30b7c9340d8b4da7d430517523e42fa1212b5bd2/cvxpy-0.4.10.tar.gz\#md5=1ba92bae4f3c7ff9ae86c30d3bdc32a5
PYTHON_CVXPY_LICENSE = Apache-2.0
PYTHON_CVXPY_LICENSE_FILES = LICENSE
PYTHON_CVXPY_SETUP_TYPE = setuptools

PYTHON_CVXPY_DEPENDENCIES = host-python-numpy openblas python-CVXcanon python-numpy python-scipy python-scs python-toolz python-multiprocess
PYTHON_CVXPY_SITE_CFG_LIBS += blas lapack

PYTHON_CVXPY_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/

define PYTHON_CVXPY_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
