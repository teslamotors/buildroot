################################################################################
#
# perl-json
#
################################################################################

PERL_JSON_VERSION = 2.90
PERL_JSON_SOURCE = JSON-$(PERL_JSON_VERSION).tar.gz
PERL_JSON_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MAKAMAKA
PERL_JSON_LICENSE = Artistic or GPLv1+
PERL_JSON_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
