################################################################################
#
# python-ecos
#
################################################################################

PYTHON_ECOS_VERSION = 2.0.7.post1
PYTHON_ECOS_SOURCE = ecos-$(PYTHON_ECOS_VERSION).tar.gz
PYTHON_ECOS_SITE = https://files.pythonhosted.org/packages/b9/3a/59aa93b573a22fda44402383aeddcc2a081c31e61080af3da9d11855c77a
PYTHON_ECOS_LICENSE = GPLv3
# There is no license file included in the source bundle.
#PYTHON_ECOS_LICENSE_FILES = COPYING
PYTHON_ECOS_SETUP_TYPE = setuptools
PYTHON_ECOS_DEPENDENCIES = host-python-numpy python-numpy python-scipy

PYTHON_ECOS_ENV = \
    PYTHONPATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/:$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/

define PYTHON_ECOS_CONFIGURE_CMDS
	for f in $$(find $(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/*numpy* -name '*.so'); do \
	    find $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/*numpy* -name $$(basename $$f) -exec cp -f $$f {} ';'; \
	done
endef

$(eval $(python-package))
