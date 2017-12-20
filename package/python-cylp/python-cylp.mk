############################################
#
# python-cylp
#
############################################

PYTHON_CYLP_VERSION = 0.7.2
# pypi only has x86 eggs for cylp, so we have to grab
# from github
PYTHON_CYLP_SITE = $(call github,coin-or,CyLP,$(PYTHON_CYLP_VERSION))
PYTHON_CYLP_LICENSE = CPLv1
PYTHON_CYLP_LICENSE_FILES = LICENSE
PYTHON_CYLP_SETUP_TYPE = distutils

PYTHON_CYLP_DEPENDENCIES = python-numpy python-scipy libcbc

PYTHON_CYLP_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
    COIN_INSTALL_DIR=$(STAGING_DIR)/usr \
    CFLAGS="--std=c++11"

define PYTHON_CYLP_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
