################################################################################
#
# libbacktrace
#
################################################################################

LIBBACKTRACE_VERSION = ba79a27ee9a62b1be86d0ddae7614c316b7f6fbb
LIBBACKTRACE_SITE = $(call github,ianlancetaylor,libbacktrace,$(LIBBACKTRACE_VERSION))
LIBBACKTRACE_LICENSE = BSD-3c
LIBBACKTRACE_LICENSE_FILES = LICENSE
LIBBACKTRACE_INSTALL_STAGING = YES

$(eval $(autotools-package))
