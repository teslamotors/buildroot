################################################################################
#
# perl-carp-clan
#
################################################################################

PERL_CARP_CLAN_VERSION = 6.06
PERL_CARP_CLAN_SOURCE = Carp-Clan-$(PERL_CARP_CLAN_VERSION).tar.gz
PERL_CARP_CLAN_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KE/KENTNL
PERL_CARP_CLAN_LICENSE = Artistic or GPLv1+
PERL_CARP_CLAN_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
