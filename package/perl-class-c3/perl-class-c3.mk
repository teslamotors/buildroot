################################################################################
#
# perl-class-c3
#
################################################################################

PERL_CLASS_C3_VERSION = 0.31
PERL_CLASS_C3_SOURCE = Class-C3-$(PERL_CLASS_C3_VERSION).tar.gz
PERL_CLASS_C3_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
PERL_CLASS_C3_DEPENDENCIES = perl-algorithm-c3
PERL_CLASS_C3_LICENSE = Artistic or GPLv1+
PERL_CLASS_C3_LICENSE_FILES = README

$(eval $(perl-package))
