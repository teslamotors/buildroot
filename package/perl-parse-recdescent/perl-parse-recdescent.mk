################################################################################
#
# perl-parse-recdescent
#
################################################################################

PERL_PARSE_RECDESCENT_VERSION = 1.967013
PERL_PARSE_RECDESCENT_SOURCE = Parse-RecDescent-$(PERL_PARSE_RECDESCENT_VERSION).tar.gz
PERL_PARSE_RECDESCENT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JT/JTBRAUN
PERL_PARSE_RECDESCENT_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
