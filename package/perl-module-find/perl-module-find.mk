################################################################################
#
# perl-module-find
#
################################################################################

PERL_MODULE_FIND_VERSION = 0.13
PERL_MODULE_FIND_SOURCE = Module-Find-$(PERL_MODULE_FIND_VERSION).tar.gz
PERL_MODULE_FIND_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CR/CRENZ
PERL_MODULE_FIND_LICENSE = Artistic or GPLv1+
PERL_MODULE_FIND_LICENSE_FILES = README

$(eval $(perl-package))
