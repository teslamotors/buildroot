################################################################################
# Generic Runit Package
#
# This file defines a series of generic install steps useful for installing
# all the necessary runit files/scripts.
# The packages that want to use this need to define
#
# RUNIT_SERVICE_NAME = <service>
#
# And add an install command before any other infrastructure comand:
#
#            $(eval $(runit-package))
#            $(eval $(generic-package))
#
#
# This will conditionally install the following files if they exist,
# with the exception of run, which is mandatory:
#
#            - run         --> /etc/sv/<service>/run
#            - finish      --> /etc/sv/<service>/finish (Optional)
#            - run.log     --> /etc/sv/<service>/log/run (Optional)
#            - config.log  --> /etc/sv/<service>/log/config (Optional)
#            _ check       --> /etc/sv/<service>/check (Optional)
#            - down        --> /etc/sv/<service>/down (Optional)
################################################################################


################################################################################
# inner-generic-runit-package -- generates the make targets needed to build
# and install a runit generic package
#
#  argument 1 is the lowercase package name
#  argument 2 is the uppercase package name, including a HOST_ prefix
#             for host packages
#  argument 3 is the desired runit service name (usually $(pkgname), but could
#             be used with foreach to make multiple instances)
define inner-runit-package

$(3)_RUNIT_SERVICE_RUN ?= run
$(3)_RUNIT_SERVICE_FINISH ?= finish
$(3)_RUNIT_SERVICE_LOG ?= run.log
$(3)_RUNIT_SERVICE_LOG_CONFIG ?= config.log
$(3)_RUNIT_SERVICE_CHECK ?= check

$(3)_RUNIT_SERVICE_NAME ?= $(shell echo $(3) | tr '[:upper:]' '[:lower:]' | tr '_' '-')

define $(3)_INSTALL_RUNIT_SERVICE
	@$$(call MESSAGE, "Installing Runit Service File(s)  $(1)")
	$$(INSTALL) -m 0755 -D $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_RUN) \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/run

	[ -f $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_FINISH) ] && \
	$$(INSTALL) -m 0755 -D $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_FINISH) \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/finish || true

	[ -f $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_LOG) ] && \
	$$(INSTALL) -m 0755 -D $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_LOG) \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/log/run || true

	[ -f $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_LOG_CONFIG) ] && \
	$$(INSTALL) -m 0644 -D $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_LOG_CONFIG) \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/log/config || true

	[ -f $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_CHECK) ] && \
	$$(INSTALL) -m 0755 -D $$($(2)_PKGDIR)/$$($(3)_RUNIT_SERVICE_CHECK) \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/check || true

	[ -f $$($(2)_PKGDIR)/down ] && \
	$$(INSTALL) -m 0644 -D $$($(2)_PKGDIR)/down \
		$$(TARGET_DIR)/etc/sv/$$($(3)_RUNIT_SERVICE_NAME)/down || true

endef
$(2)_POST_INSTALL_TARGET_HOOKS += $(3)_INSTALL_RUNIT_SERVICE

endef # inner-runit-package

runit-package = $(call inner-runit-package,$(pkgname),$(call UPPERCASE, $(pkgname)),$(call UPPERCASE, $(pkgname)))

################################################################################
# Instantiate multiple instances of the same service
#
# Use like:
#          FOO_RUNIT_SERVICE_NAME = foo
#          FOO_INSTANCES = 1 2 3 bar
#          $(eval $(call runit-package-n,$(FOO_INSTANCES)))
#          $(eval $(generic-package))
# This will create four separate instances of the run file and support scripts.
# E.g.
#   - foo-1
#   - foo-2
#   - foo-3
#   - foo-bar
################################################################################
runit-package-n = $(foreach i,$(1),$(call inner-runit-package,$(pkgname),$(call UPPERCASE, $(pkgname)),$(call UPPERCASE, $(pkgname)-$(i))))

# :mode=makefile:
