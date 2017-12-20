################################################################################
#
# perl-module-pluggable
#
################################################################################

PERL_MODULE_PLUGGABLE_VERSION = 5.2
PERL_MODULE_PLUGGABLE_SOURCE = Module-Pluggable-$(PERL_MODULE_PLUGGABLE_VERSION).tar.gz
PERL_MODULE_PLUGGABLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMONW
PERL_MODULE_PLUGGABLE_LICENSE = Artistic or GPLv1+
PERL_MODULE_PLUGGABLE_LICENSE_FILES = README

$(eval $(perl-package))
