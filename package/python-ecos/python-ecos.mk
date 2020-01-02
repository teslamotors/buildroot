################################################################################
#
# python-ecos
#
################################################################################

PYTHON_ECOS_VERSION = 2.0.4
PYTHON_ECOS_SOURCE = ecos-$(PYTHON_ECOS_VERSION).tar.gz
PYTHON_ECOS_SITE = https://pypi.python.org/packages/77/09/a310016980c7652e6470d5bf4938d792b5c99528b16d5c20ca5e3e377bf0/ecos-2.0.4.tar.gz\#md5=39cc4c4a5598cc51ca4dc9aec810f41a
PYTHON_ECOS_LICENSE = GPLv3
# There is no license file included in the source bundle.
#PYTHON_ECOS_LICENSE_FILES = COPYING
PYTHON_ECOS_SETUP_TYPE = setuptools
PYTHON_ECOS_DEPENDENCIES = host-python-numpy python-numpy python-scipy

PYTHON_ECOS_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/

define PYTHON_ECOS_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
