################################################################################
#
# tpm2-tss-engine
#
################################################################################

TPM2_TSS_ENGINE_VERSION = 1.0.0 
TPM2_TSS_ENGINE_SITE = https://github.com/tpm2-software/tpm2-tss-engine/releases/download/v$(TPM2_TSS_ENGINE_VERSION)/tpm2-tss-engine-$(TPM2_TSS_ENGINE_VERSION).tar.gz 
TPM2_TSS_ENGINE_LICENSE = BSD-2-Clause
TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
TPM2_TSS_ENGINE_INSTALL_STAGING = YES
TPM2_TSS_ENGINE_DEPENDENCIES = tpm2-tss openssl host-pkgconf host-autoconf-archive
TPM2_TSS_ENGINE_CONF_OPTS = --disable-doxygen-doc --with-enginesdir=/usr/lib/engines-1.1
TPM2_TSS_ENGINE_AUTORECONF_OPTS = --install -I $(HOST_DIR)/usr/share/autoconf-archive
TPM2_TSS_ENGINE_AUTORECONF = YES

# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
# in the toolchain wrapper and CFLAGS are used instead
TPM2_TSS_ENGINE_CONF_ENV = \
	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no \
	ax_cv_check_ccppflags___________Wall__Werror_______U_FORTIFY_SOURCE=no \
	ax_cv_check_ccppflags___________Wall__Werror_______D_FORTIFY_SOURCE_2=no

$(eval $(autotools-package))
