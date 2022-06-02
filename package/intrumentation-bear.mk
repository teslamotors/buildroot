################################################################################
# Caching for Bear Instrumentation
# author: opensource@tesla.com
#
# This file is used to support caching bear instrumentation (which is used to
# capture gcc/g++ build commands for compilation databases)
#
# It will produce a compilation database (cdb) named
# $PKG_compile_commands.json, and store it in the build directory of the
# package
#
# if LD_PRELOAD is does not contain libear.so this instrumentation will not be
# loaded, as it will not be needed
#
# Also see SECURITY_VALIDATION in the firmware/os/README.md
#
################################################################################

ifneq (,$(findstring libear.so,${LD_PRELOAD}))

define bear
  $(if $(filter end,$(1)),support/scripts/bear-cache.sh "$(1)" "$(2)" "$(3)" "$($(PKG)_BUILDDIR)")
endef

GLOBAL_INSTRUMENTATION_HOOKS += bear

endif

