################################################################################
#
# musl-compat-headers
#
################################################################################

MUSL_COMPAT_HEADERS_LICENSE = BSD-3-Clause, Public Domain or CC0
MUSL_COMPAT_HEADERS_LICENSE_FILES = queue.h cdefs.h

MUSL_COMPAT_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO

# Only installs headers
MUSL_COMPAT_HEADERS_INSTALL_TARGET = NO
MUSL_COMPAT_HEADERS_INSTALL_STAGING = YES

# Copying both headers so legal-info finds them (they are _LICENSE_FILES)
define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/queue.h $(@D)/queue.h
	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h $(@D)/cdefs.h
endef

define MUSL_COMPAT_HEADERS_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/queue.h \
		$(STAGING_DIR)/usr/include/sys/queue.h
	$(INSTALL) -D -m 0644 $(@D)/cdefs.h \
		$(STAGING_DIR)/usr/include/sys/cdefs.h
endef

$(eval $(generic-package))
