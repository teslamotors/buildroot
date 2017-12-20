################################################################################
#
# perl-config-any
#
################################################################################

PERL_CONFIG_ANY_VERSION = 0.27
PERL_CONFIG_ANY_SOURCE = Config-Any-$(PERL_CONFIG_ANY_VERSION).tar.gz
PERL_CONFIG_ANY_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BR/BRICAS
PERL_CONFIG_ANY_DEPENDENCIES = perl-module-pluggable
PERL_CONFIG_ANY_LICENSE = Artistic or GPLv1+
PERL_CONFIG_ANY_LICENSE_FILES = README

$(eval $(perl-package))
