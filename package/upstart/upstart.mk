################################################################################
#
# upstart
#
################################################################################

UPSTART_VERSION_MAJOR := 0.6
UPSTART_VERSION_DOT   := 6
UPSTART_VERSION := $(UPSTART_VERSION_MAJOR).$(UPSTART_VERSION_DOT)
UPSTART_SITE := http://upstart.ubuntu.com/download/$(UPSTART_VERSION_MAJOR)
UPSTART_DEPENDENCIES := eudev libnih json-c dbus

UPSTART_CONF_OPTS += --exec-prefix=/

$(eval $(autotools-package))
