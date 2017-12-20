################################################################################
#
# perl-hash-merge
#
################################################################################

PERL_HASH_MERGE_VERSION = 0.200
PERL_HASH_MERGE_SOURCE = Hash-Merge-$(PERL_HASH_MERGE_VERSION).tar.gz
PERL_HASH_MERGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
PERL_HASH_MERGE_DEPENDENCIES = perl-clone
PERL_HASH_MERGE_LICENSE = Artistic or GPLv1+
PERL_HASH_MERGE_LICENSE_FILES = README

$(eval $(perl-package))
