################################################################################
#
# perl-list-moreutils
#
################################################################################

PERL_LIST_MOREUTILS_VERSION = 0.416
PERL_LIST_MOREUTILS_SOURCE = List-MoreUtils-$(PERL_LIST_MOREUTILS_VERSION).tar.gz
PERL_LIST_MOREUTILS_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
HOST_PERL_LIST_MOREUTILS_DEPENDENCIES = host-perl-config-autoconf host-perl-exporter-tiny host-perl-inc-latest
PERL_LIST_MOREUTILS_LICENSE = Artistic or GPLv1+
PERL_LIST_MOREUTILS_LICENSE_FILES = ARTISTIC-1.0 LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
