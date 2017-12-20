################################################################################
#
# perl-strictures
#
################################################################################

PERL_STRICTURES_VERSION = 2.000003
PERL_STRICTURES_SOURCE = strictures-$(PERL_STRICTURES_VERSION).tar.gz
PERL_STRICTURES_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
PERL_STRICTURES_LICENSE = Artistic or GPLv1+
PERL_STRICTURES_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
