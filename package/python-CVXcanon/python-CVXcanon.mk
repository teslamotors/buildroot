############################################
#
# python-CVXcanon
#
############################################

PYTHON_CVXCANON_VERSION = 1026961e3468b038b91264be66ae49cfb03c4d58
PYTHON_CVXCANON_SITE = $(call github,cvxgrp,CVXcanon,$(PYTHON_CVXCANON_VERSION))
PYTHON_CVXCANON_LICENSE = Apache-2.0
PYTHON_CVXCANON_LICENSE_FILES = LICENSE
PYTHON_CVXCANON_SETUP_TYPE = distutils

PYTHON_CVXCANON_DEPENDENCIES = host-python-numpy python-numpy python-scipy clapack openblas
PYTHON_CVXCANON_SITE_CFG_LIBS += blas lapack

PYTHON_CVXCANON_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/

define PYTHON_CVXCANON_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
