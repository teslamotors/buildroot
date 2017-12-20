################################################################################
#
# perl-dbix-class
#
################################################################################

PERL_DBIX_CLASS_VERSION = 0.082840
PERL_DBIX_CLASS_SOURCE = DBIx-Class-$(PERL_DBIX_CLASS_VERSION).tar.gz
PERL_DBIX_CLASS_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RI/RIBASUSHI
PERL_DBIX_CLASS_DEPENDENCIES = host-perl-dbd-sqlite host-perl-package-stash perl-class-accessor-grouped perl-class-c3-componentised perl-class-inspector perl-config-any perl-context-preserve perl-dbi perl-data-dumper-concise perl-data-page perl-devel-globaldestruction perl-hash-merge perl-mro-compat perl-module-find perl-moo perl-path-class perl-sql-abstract perl-scope-guard perl-sub-name perl-try-tiny perl-namespace-clean
PERL_DBIX_CLASS_LICENSE = Artistic or GPLv1+
PERL_DBIX_CLASS_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
