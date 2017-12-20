################################################################################
#
# tesla-python-pytz
#
################################################################################

TESLA_PYTHON_PYTZ_VERSION = 2016.6.1
TESLA_PYTHON_PYTZ_SITE = https://pypi.python.org/packages/5d/8e/6635d8f3f9f48c03bb925fab543383089858271f9cfd1216b83247e8df94/pytz-2016.6.1.tar.gz#md5=b6c28a3b968bc1d8badfb61b93874e03
TESLA_PYTHON_PYTZ_SOURCE = pytz-$(TESLA_PYTHON_PYTZ_VERSION).tar.gz
TESLA_PYTHON_PYTZ_LICENSE = MIT
TESLA_PYTHON_PYTZ_SETUP_TYPE = distutils

$(eval $(python-package))
