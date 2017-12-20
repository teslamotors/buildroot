################################################################################
#
# tesla-findutils
#
################################################################################

TESLA_FINDUTILS_VERSION = 4.2.31
TESLA_FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
TESLA_FINDUTILS_SOURCE = findutils-$(TESLA_FINDUTILS_VERSION).tar.gz
TESLA_FINDUTILS_LICENSE = GPLv2
TESLA_FINDUTILS_LICENSE_FILES = COPYING
TESLA_FINDUTILS_CONF_ENV = \
	gl_cv_func_stdin=yes \
	ac_cv_func_working_mktime=yes \
	gl_cv_func_wcwidth_works=yes

$(eval $(autotools-package))
