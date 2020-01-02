################################################################################
#
# python-plotly
#
################################################################################

PYTHON_PLOTLY_VERSION = 2.3.0
PYTHON_PLOTLY_SOURCE = plotly-$(PYTHON_PLOTLY_VERSION).tar.gz
PYTHON_PLOTLY_SITE = https://pypi.python.org/packages/c4/67/caefc6ac1da8ee9db44b26ff28428f732acabe6767711b7a5bcc7f92498a
PYTHON_PLOTLY_SETUP_TYPE = setuptools
PYTHON_PLOTLY_LICENSE = MIT

$(eval $(python-package))
