################################################################################
#
# perl-clone
#
################################################################################

PERL_CLONE_VERSION = 0.38
PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
PERL_CLONE_LICENSE = Artistic or GPLv1+
PERL_CLONE_LICENSE_FILES = README

$(eval $(perl-package))
