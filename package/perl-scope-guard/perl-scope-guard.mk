################################################################################
#
# perl-scope-guard
#
################################################################################

PERL_SCOPE_GUARD_VERSION = 0.21
PERL_SCOPE_GUARD_SOURCE = Scope-Guard-$(PERL_SCOPE_GUARD_VERSION).tar.gz
PERL_SCOPE_GUARD_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHOCOLATE
PERL_SCOPE_GUARD_LICENSE = Artistic or GPLv1+
PERL_SCOPE_GUARD_LICENSE_FILES = README

$(eval $(perl-package))
