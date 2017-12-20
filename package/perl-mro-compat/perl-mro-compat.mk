################################################################################
#
# perl-mro-compat
#
################################################################################

PERL_MRO_COMPAT_VERSION = 0.12
PERL_MRO_COMPAT_SOURCE = MRO-Compat-$(PERL_MRO_COMPAT_VERSION).tar.gz
PERL_MRO_COMPAT_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BO/BOBTFISH
PERL_MRO_COMPAT_LICENSE = Artistic or GPLv1+
PERL_MRO_COMPAT_LICENSE_FILES = README

$(eval $(perl-package))
