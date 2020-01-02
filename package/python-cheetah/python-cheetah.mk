################################################################################
#
# python-cheetah
#
################################################################################

PYTHON_CHEETAH_VERSION = 3.2.3
PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/3e/16/c711180492c9f40fb64dffb436fe1b91e3031637b478edb8de3c4b74097a
PYTHON_CHEETAH_LICENSE = MIT
PYTHON_CHEETAH_SETUP_TYPE = setuptools

$(eval $(python-package))
$(eval $(host-python-package))
