################################################################################
#
# readline
#
################################################################################

READLINE_VERSION = 8.1
READLINE_SITE = $(BR2_GNU_MIRROR)/readline
READLINE_INSTALL_STAGING = YES
READLINE_DEPENDENCIES = ncurses host-autoconf
HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
	bash_cv_wcwidth_broken=no
READLINE_LICENSE = GPLv2
READLINE_LICENSE_FILES = COPYING
READLINE_CPE_ID_VENDOR = gnu

ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),y)
READLINE_CONF_OPTS += --enable-bracketed-paste-default
else
READLINE_CONF_OPTS += --disable-bracketed-paste-default
endif

# readline only uses autoconf, not automake, and therefore the regular
# AUTORECONF = YES doesn't work.
define READLINE_AUTOCONF
	cd $(@D); $(HOST_DIR)/bin/autoconf
endef
READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF
HOST_READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF

define READLINE_PURGE_EXAMPLES
	rm -rf $(TARGET_DIR)/usr/share/readline
endef
READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES

define READLINE_INSTALL_INPUTRC
	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
endef
READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC

$(eval $(autotools-package))
$(eval $(host-autotools-package))
