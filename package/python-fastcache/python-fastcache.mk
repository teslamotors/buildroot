##############################################################
#
# python-fastcache
#
##############################################################

PYTHON_FASTCACHE_VERSION = 1.0.2
PYTHON_FASTCACHE_SOURCE = fastcache-$(PYTHON_FASTCACHE_VERSION).tar.gz
PYTHON_FASTCACHE_SITE = https://pypi.python.org/packages/fb/98/93f2d36738868e8dd5a8dbfc918169b24658f63e5fa041fe000c22ae4f8b
PYTHON_FASTCACHE_LICENSE = MIT
# There is no license file included in the source bundle.
#PYTHON_FASTCACHE_LICENSE_FILES = LICENSE.txt
PYTHON_FASTCACHE_SETUP_TYPE = distutils

$(eval $(python-package))
