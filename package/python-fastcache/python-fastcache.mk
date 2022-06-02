##############################################################
#
# python-fastcache
#
##############################################################

PYTHON_FASTCACHE_VERSION = 1.1.0
PYTHON_FASTCACHE_SOURCE = fastcache-$(PYTHON_FASTCACHE_VERSION).tar.gz
PYTHON_FASTCACHE_SITE = https://files.pythonhosted.org/packages/5f/a3/b280cba4b4abfe5f5bdc643e6c9d81bf3b9dc2148a11e5df06b6ba85a560
PYTHON_FASTCACHE_LICENSE = MIT
# There is no license file included in the source bundle.
#PYTHON_FASTCACHE_LICENSE_FILES = LICENSE.txt
PYTHON_FASTCACHE_SETUP_TYPE = distutils

$(eval $(python-package))
