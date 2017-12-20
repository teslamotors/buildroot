################################################################################
#
# perl-data-page
#
################################################################################

PERL_DATA_PAGE_VERSION = 2.02
PERL_DATA_PAGE_SOURCE = Data-Page-$(PERL_DATA_PAGE_VERSION).tar.gz
PERL_DATA_PAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LB/LBROCARD
PERL_DATA_PAGE_DEPENDENCIES = host-perl-module-build perl-class-accessor-chained
PERL_DATA_PAGE_LICENSE = Artistic or GPLv1+
PERL_DATA_PAGE_LICENSE_FILES = README

$(eval $(perl-package))
