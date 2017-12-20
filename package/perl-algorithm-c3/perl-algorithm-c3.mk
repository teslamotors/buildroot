################################################################################
#
# perl-algorithm-c3
#
################################################################################

PERL_ALGORITHM_C3_VERSION = 0.10
PERL_ALGORITHM_C3_SOURCE = Algorithm-C3-$(PERL_ALGORITHM_C3_VERSION).tar.gz
PERL_ALGORITHM_C3_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
PERL_ALGORITHM_C3_LICENSE = Artistic or GPLv1+
PERL_ALGORITHM_C3_LICENSE_FILES = README

$(eval $(perl-package))
