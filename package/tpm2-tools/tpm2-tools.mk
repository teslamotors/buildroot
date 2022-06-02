################################################################################
#
# tpm2-tools
#
################################################################################

TPM2_TOOLS_VERSION = 4.1.2
TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
TPM2_TOOLS_LICENSE = BSD-3-Clause
TPM2_TOOLS_LICENSE_FILES = LICENSE
TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf

# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
# in the toolchain wrapper and CFLAGS are used instead
TPM2_TOOLS_CONF_OPTS = --disable-hardening

# do not build man pages
TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''

ifneq ($(BR2_PACKAGE_TPM2_TOOLS_BINS),)
TPM2_TOOLS_BINS := $(foreach bin,$(call qstrip,$(BR2_PACKAGE_TPM2_TOOLS_BINS)),tools/tpm2_$(bin))
TPM2_TOOLS_INSTALL_TARGET_OPTS = \
	bin_PROGRAMS="$(TPM2_TOOLS_BINS)" \
	DESTDIR=$(TARGET_DIR) \
	install
endif

$(eval $(autotools-package))
