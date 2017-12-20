################################################################################
#
# perl-class-c3-componentised
#
################################################################################

PERL_CLASS_C3_COMPONENTISED_VERSION = 1.001000
PERL_CLASS_C3_COMPONENTISED_SOURCE = Class-C3-Componentised-$(PERL_CLASS_C3_COMPONENTISED_VERSION).tar.gz
PERL_CLASS_C3_COMPONENTISED_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FR/FREW
PERL_CLASS_C3_COMPONENTISED_DEPENDENCIES = perl-class-c3 perl-class-inspector perl-mro-compat
PERL_CLASS_C3_COMPONENTISED_LICENSE = Artistic or GPLv1+
PERL_CLASS_C3_COMPONENTISED_LICENSE_FILES = README

$(eval $(perl-package))
