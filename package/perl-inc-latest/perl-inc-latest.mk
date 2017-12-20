################################################################################
#
# perl-inc-latest
#
################################################################################

PERL_INC_LATEST_VERSION = 0.500
PERL_INC_LATEST_SOURCE = inc-latest-$(PERL_INC_LATEST_VERSION).tar.gz
PERL_INC_LATEST_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
PERL_INC_LATEST_LICENSE = Apache-2.0
PERL_INC_LATEST_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
