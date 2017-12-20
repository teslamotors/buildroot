################################################################################
#
# tesla-gzip
#
################################################################################

TESLA_GZIP_VERSION = 1.3.12
TESLA_GZIP_SOURCE = gzip-$(TESLA_GZIP_VERSION).tar.gz
TESLA_GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
# Some other tools expect it to be in /bin
TESLA_GZIP_CONF_OPTS = --exec-prefix=/
# Prefer full gzip over potentially lightweight/slower from busybox
TESLA_GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
TESLA_GZIP_LICENSE = GPLv2
TESLA_GZIP_LICENSE_FILES = COPYING
TESLA_GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes

$(eval $(autotools-package))
