################################################################################
#
# python-altgraph
#
################################################################################

PYTHON_ALTGRAPH_VERSION = 0.16.1
PYTHON_ALTGRAPH_SOURCE = altgraph-$(PYTHON_ALTGRAPH_VERSION).tar.gz
PYTHON_ALTGRAPH_SITE = https://files.pythonhosted.org/packages/da/a4/6c508ac94d7a65859a7a47e6fbde4aa6b81d0f0863aa45861241e782391c
PYTHON_ALTGRAPH_SETUP_TYPE = setuptools
PYTHON_ALTGRAPH_LICENSE = MIT
PYTHON_ALTGRAPH_LICENSE_FILES = LICENSE

$(eval $(python-package))
