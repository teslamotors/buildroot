################################################################################
#
# perl-dbix-class-optimisticlocking
#
################################################################################

PERL_DBIX_CLASS_OPTIMISTICLOCKING_VERSION = 0.02
PERL_DBIX_CLASS_OPTIMISTICLOCKING_SOURCE = DBIx-Class-OptimisticLocking-$(PERL_DBIX_CLASS_OPTIMISTICLOCKING_VERSION).tar.gz
PERL_DBIX_CLASS_OPTIMISTICLOCKING_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPHILLIPS
PERL_DBIX_CLASS_OPTIMISTICLOCKING_DEPENDENCIES = host-perl-dbix-class perl-dbix-class
PERL_DBIX_CLASS_OPTIMISTICLOCKING_LICENSE = Artistic or GPLv1+
PERL_DBIX_CLASS_OPTIMISTICLOCKING_LICENSE_FILES = LICENSE

$(eval $(perl-package))
