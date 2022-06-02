############################################
#
# python-tqdm
#
############################################

PYTHON_TQDM_VERSION = 4.52.0
PYTHON_TQDM_SOURCE = tqdm-${PYTHON_TQDM_VERSION}.tar.gz
PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/9f/30/8c8015735a54e13444a3d4982a7a9538bde27f8b3bd35203f9e920f0d78c
# Changes to tqdm must be disclosed under MPL 2.0: https://www.mozilla.org/en-US/MPL/2.0/
PYTHON_TQDM_LICENSE = MIT, MPLv2.0
PYTHON_TQDM_SETUP_TYPE = setuptools
PYTHON_TQDM_LICENSE_FILES = LICENSE


$(eval $(python-package))
