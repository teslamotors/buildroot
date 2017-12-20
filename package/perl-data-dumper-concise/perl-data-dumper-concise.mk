################################################################################
#
# perl-data-dumper-concise
#
################################################################################

PERL_DATA_DUMPER_CONCISE_VERSION = 2.022
PERL_DATA_DUMPER_CONCISE_SOURCE = Data-Dumper-Concise-$(PERL_DATA_DUMPER_CONCISE_VERSION).tar.gz
PERL_DATA_DUMPER_CONCISE_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FR/FREW
PERL_DATA_DUMPER_CONCISE_LICENSE = Artistic or GPLv1+

$(eval $(perl-package))
