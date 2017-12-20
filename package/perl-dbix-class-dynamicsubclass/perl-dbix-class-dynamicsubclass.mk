################################################################################
#
# perl-dbix-class-dynamicsubclass
#
################################################################################

PERL_DBIX_CLASS_DYNAMICSUBCLASS_VERSION = 0.03
PERL_DBIX_CLASS_DYNAMICSUBCLASS_SOURCE = DBIx-Class-DynamicSubclass-$(PERL_DBIX_CLASS_DYNAMICSUBCLASS_VERSION).tar.gz
PERL_DBIX_CLASS_DYNAMICSUBCLASS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SY/SYBER
PERL_DBIX_CLASS_DYNAMICSUBCLASS_DEPENDENCIES = host-perl-dbd-sqlite host-perl-sql-translator perl-dbix-class
PERL_DBIX_CLASS_DYNAMICSUBCLASS_LICENSE = Artistic or GPLv1+

$(eval $(perl-package))
