################################################################################
#
# tesla-bash
#
################################################################################

TESLA_BASH_VERSION = 3.2.57
TESLA_BASH_SITE = $(BR2_GNU_MIRROR)/bash
TESLA_BASH_SOURCE = bash-$(TESLA_BASH_VERSION).tar.gz
# Build after since bash is better than busybox shells
TESLA_BASH_DEPENDENCIES = ncurses readline host-bison \
	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
TESLA_BASH_CONF_OPTS = --with-installed-readline
TESLA_BASH_LICENSE = GPLv2
TESLA_BASH_LICENSE_FILES = COPYING
TESLA_BASH_POST_INSTALL_TARGET_HOOKS += TESLA_BASH_COPY_AFTER_INSTALL

TESLA_BASH_CONF_ENV += \
	ac_cv_rl_prefix="$(STAGING_DIR)" \
	ac_cv_rl_version="$(READLINE_VERSION)" \
	bash_cv_getcwd_malloc=yes \
	bash_cv_job_control_missing=present \
	bash_cv_sys_named_pipes=present \
	bash_cv_func_sigsetjmp=present \
	bash_cv_printf_a_format=yes

# The static build needs some trickery
ifeq ($(BR2_STATIC_LIBS),y)
TESLA_BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
# bash wants to redefine the getenv() function. To check whether this is
# possible, AC_TRY_RUN is used which is not possible in
# cross-compilation.
# On uClibc, redefining getenv is not possible; on glibc and musl it is.
# Related:
# http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
TESLA_BASH_CONF_ENV += bash_cv_getenv_redef=no
else
TESLA_BASH_CONF_ENV += bash_cv_getenv_redef=yes
endif
endif

ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
# bash's internal malloc implementation invokes sbrk with a non-zero
# argument.  musl's sbrk implementation returns NULL in this case, and
# bash has no fallback so crashes immediately on startup.
TESLA_BASH_CONF_OPTS += --without-bash-malloc
endif

define TESLA_BASH_COPY_AFTER_INSTALL
	ln -s -f /usr/bin/bash $(TARGET_DIR)/bin/bash
	rm -f $(TARGET_DIR)/usr/bin/bashbug
endef

# Not changing the shell to bash, for now.
 
# Make /bin/sh -> bash (no other shell, better than busybox shells)
#define BASH_INSTALL_TARGET_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
#		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
#	rm -f $(TARGET_DIR)/bin/bashbug
#endef

$(eval $(autotools-package))
