################################################################################
#
# python-flatbuffers
#
################################################################################

PYTHON_FLATBUFFERS_VERSION = 1.10
PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/f9/b8/e1c19502de48f4126151f139b1d311f439fe295530295fce5a30b5784ad4
PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
PYTHON_FLATBUFFERS_LICENSE = APACHE2

$(eval $(python-package))
