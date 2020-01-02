################################################################################
#
# python-aioes
#
################################################################################

PYTHON_AIOES_VERSION = 0.7.2
PYTHON_AIOES_SOURCE = aioes-$(PYTHON_AIOES_VERSION).tar.gz
PYTHON_AIOES_SITE = https://files.pythonhosted.org/packages/80/cc/d762ea050bf263a327a9d9882cb0a8f781eab3367f9e6f3b6288964599d8
PYTHON_AIOES_SETUP_TYPE = setuptools
PYTHON_AIOES_LICENSE = APACHE2
PYTHON_AIOES_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
