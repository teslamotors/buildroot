################################################################
#
# tesla-python-jsonschema
#
################################################################

TESLA_PYTHON_JSONSCHEMA_VERSION = 2.5.1
TESLA_PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(TESLA_PYTHON_JSONSCHEMA_VERSION).tar.gz
TESLA_PYTHON_JSONSCHEMA_SITE = https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
TESLA_PYTHON_JSONSCHEMA_LICENSE = MIT
TESLA_PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING
TESLA_PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools

$(eval $(python-package))
