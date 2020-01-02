################################################################################
#
# python-aiofiles
#
################################################################################

PYTHON_AIOFILES_VERSION = 0.4.0
PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/94/c2/e3cb60c1b7d9478203d4514e2d33ea424ad9bb98e45b21d6225db93f25c9
PYTHON_AIOFILES_SETUP_TYPE = setuptools
PYTHON_AIOFILES_LICENSE = APACHE2
PYTHON_AIOFILES_LICENSE_FILES = LICENSE

$(eval $(python-package))
