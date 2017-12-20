################################################################################
#
# perl-class-accessor-chained
#
################################################################################

PERL_CLASS_ACCESSOR_CHAINED_VERSION = 0.01
PERL_CLASS_ACCESSOR_CHAINED_SOURCE = Class-Accessor-Chained-$(PERL_CLASS_ACCESSOR_CHAINED_VERSION).tar.gz
PERL_CLASS_ACCESSOR_CHAINED_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RC/RCLAMP
PERL_CLASS_ACCESSOR_CHAINED_DEPENDENCIES = perl-class-accessor
PERL_CLASS_ACCESSOR_CHAINED_LICENSE = Artistic or GPLv1+
PERL_CLASS_ACCESSOR_CHAINED_LICENSE_FILES = README

$(eval $(perl-package))
