################################################################################
#
# python-asyncssh
#
################################################################################

PYTHON_ASYNCSSH_VERSION = 1.12.2
PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/b0/61/024ecb21e450d4052ed6befd197beea07c6d36b0b021e563281ae2e6c899
PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
PYTHON_ASYNCSSH_LICENSE = ECLIPSE2
PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE

$(eval $(python-package))
