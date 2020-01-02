################################################################################
#
# sqlite
#
################################################################################

SQLITE_VERSION = 3250300
SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
SQLITE_SITE = https://www.sqlite.org/2018
SQLITE_LICENSE = Public domain
SQLITE_LICENSE_FILES = tea/license.terms
SQLITE_INSTALL_STAGING = YES

ifneq ($(BR2_PACKAGE_SQLITE_MAX_PAGE_COUNT),)
SQLITE_CFLAGS += -DSQLITE_MAX_PAGE_COUNT=$(BR2_PACKAGE_SQLITE_MAX_PAGE_COUNT)
endif

ifeq ($(BR2_PACKAGE_SQLITE_RTREE),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_RTREE=1
endif

ifeq ($(BR2_PACKAGE_SQLITE_MEMSYS5),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_MEMSYS5
endif

ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
endif

ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
endif

ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
endif

ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
endif

ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
endif

ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
endif

ifeq ($(BR2_PACKAGE_SQLITE_NO_SYNC),y)
SQLITE_CFLAGS += -DSQLITE_NO_SYNC
endif

# fallback to standard -O3 when -Ofast is present to avoid -ffast-math
SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))

SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"

ifeq ($(BR2_STATIC_LIBS),y)
SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
else
SQLITE_CONF_OPTS += --disable-static-shell
# the sqlite build system is buggy in that it loses its own default CFLAGS
# for building the shared library with libtool when using the
# --disable-static-shell option.  work around that by putting the default
# options into CFLAGS that will get passed to libtool invocations.
SQLITE_CFLAGS += -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_ENABLE_DBPAGE_VTAB -DSQLITE_ENABLE_STMTVTAB -DSQLITE_ENABLE_DBSTAT_VTAB
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
SQLITE_CONF_OPTS += --enable-threadsafe
else
SQLITE_CONF_OPTS += --disable-threadsafe
SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
endif

ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
SQLITE_DEPENDENCIES += ncurses readline
SQLITE_CONF_OPTS += --disable-editline --enable-readline
else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
SQLITE_DEPENDENCIES += libedit
SQLITE_CONF_OPTS += --enable-editline --disable-readline
else
SQLITE_CONF_OPTS += --disable-editline --disable-readline
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
