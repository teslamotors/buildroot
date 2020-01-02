################################################################################
#
# yavta
#
################################################################################

YAVTA_VERSION = dd0a2c963b09e52094b1694b52c928aaa336e9c7
YAVTA_SITE = git://git.ideasonboard.org/yavta.git
YAVTA_LICENSE = GPL-2.0+
YAVTA_LICENSE_FILES = COPYING.GPL

# We require the -Iinclude that is missing due to yavta makefile using ?=
# "CFLAGS  ?= -O2 -W -Wall -Iinclude"
YAVTA_CFLAGS = $(TARGET_CFLAGS)
YAVTA_CFLAGS += -Iinclude

define YAVTA_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(YAVTA_CFLAGS)" -C $(@D)
endef

define YAVTA_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
endef

$(eval $(generic-package))
