################################################################################
#
# tesla-grep
#
################################################################################

TESLA_GREP_VERSION = 2.5.1a
TESLA_GREP_SITE = $(BR2_GNU_MIRROR)/grep
TESLA_GREP_SOURCE = grep-$(TESLA_GREP_VERSION).tar.gz
TESLA_GREP_LICENSE = GPLv2
TESLA_GREP_LICENSE_FILES = COPYING
TESLA_GREP_CONF_OPTS = --disable-perl-regexp \
	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
TESLA_GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)

# link with iconv if enabled
ifeq ($(BR2_PACKAGE_LIBICONV),y)
TESLA_GREP_CONF_ENV += LIBS=-liconv
TESLA_GREP_DEPENDENCIES += libiconv
endif

# link with pcre if enabled
ifeq ($(BR2_PACKAGE_PCRE),y)
TESLA_GREP_CONF_OPTS += --enable-perl-regexp
TESLA_GREP_DEPENDENCIES += pcre
endif

# Full grep preferred over busybox grep
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
TESLA_GREP_DEPENDENCIES += busybox
endif

$(eval $(autotools-package))
