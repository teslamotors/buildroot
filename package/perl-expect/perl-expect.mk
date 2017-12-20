################################################################################
#
# perl-expect
#
################################################################################

PERL_EXPECT_VERSION = 1.33
PERL_EXPECT_SOURCE = Expect-$(PERL_EXPECT_VERSION).tar.gz
PERL_EXPECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JA/JACOBY

$(eval $(perl-package))
