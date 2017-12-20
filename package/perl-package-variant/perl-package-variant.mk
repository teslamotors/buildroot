################################################################################
#
# perl-package-variant
#
################################################################################

PERL_PACKAGE_VARIANT_VERSION = 1.003002
PERL_PACKAGE_VARIANT_SOURCE = Package-Variant-$(PERL_PACKAGE_VARIANT_VERSION).tar.gz
PERL_PACKAGE_VARIANT_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MS/MSTROUT
HOST_PERL_PACKAGE_VARIANT_DEPENDENCIES = host-perl-import-into host-perl-module-runtime host-perl-strictures
PERL_PACKAGE_VARIANT_LICENSE = Artistic or GPLv1+
PERL_PACKAGE_VARIANT_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
