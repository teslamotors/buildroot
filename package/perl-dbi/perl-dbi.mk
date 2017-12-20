################################################################################
#
# perl-dbi
#
################################################################################

PERL_DBI_VERSION = 1.636
PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
PERL_DBI_LICENSE = Artistic or GPLv1+
PERL_DBI_LICENSE_FILES = LICENSE

$(eval $(perl-package))
$(eval $(host-perl-package))
