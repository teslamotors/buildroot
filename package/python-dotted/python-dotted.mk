################################################################################
#
# python-dotted
#
################################################################################

PYTHON_DOTTED_VERSION = 0.1.8
PYTHON_DOTTED_SOURCE = dotted-$(PYTHON_DOTTED_VERSION).tar.gz
PYTHON_DOTTED_SITE = https://files.pythonhosted.org/packages/64/1b/9b00a961c7d2b3619df9ca930b3d800ef4f0988e0df84618e14250d1f42e
PYTHON_DOTTED_SETUP_TYPE = setuptools
PYTHON_DOTTED_LICENSE = MIT
PYTHON_DOTTED_LICENSE_FILES = LICENSE

$(eval $(python-package))
