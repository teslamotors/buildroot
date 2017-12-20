################################################################################
#
# perl-class-xsaccessor
#
################################################################################

PERL_CLASS_XSACCESSOR_VERSION = 1.19
PERL_CLASS_XSACCESSOR_SOURCE = Class-XSAccessor-$(PERL_CLASS_XSACCESSOR_VERSION).tar.gz
PERL_CLASS_XSACCESSOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SM/SMUELLER
PERL_CLASS_XSACCESSOR_LICENSE = Artistic or GPLv1+
PERL_CLASS_XSACCESSOR_LICENSE_FILES = README

$(eval $(perl-package))
