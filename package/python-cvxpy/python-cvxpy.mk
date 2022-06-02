############################################
#
# python-cvxpy
#
############################################

PYTHON_CVXPY_VERSION = v0.4.11
PYTHON_CVXPY_SOURCE = cvxpy-$(PYTHON_CVXPY_VERSION).tar.gz
PYTHON_CVXPY_SITE = $(call github,cvxgrp,cvxpy,$(PYTHON_CVXPY_VERSION))
PYTHON_CVXPY_LICENSE = Apache-2.0
PYTHON_CVXPY_LICENSE_FILES = LICENSE
PYTHON_CVXPY_SETUP_TYPE = setuptools

PYTHON_CVXPY_DEPENDENCIES = host-python-numpy openblas python-CVXcanon python-numpy python-scipy python-cylp python-toolz python-multiprocess python-six python-fastcache
PYTHON_CVXPY_SITE_CFG_LIBS += blas lapack

define PYTHON_CVXPY_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
