################################################################################
#
# perl-b-hooks-endofscope
#
################################################################################

PERL_B_HOOKS_ENDOFSCOPE_VERSION = 0.21
PERL_B_HOOKS_ENDOFSCOPE_SOURCE = B-Hooks-EndOfScope-$(PERL_B_HOOKS_ENDOFSCOPE_VERSION).tar.gz
PERL_B_HOOKS_ENDOFSCOPE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
PERL_B_HOOKS_ENDOFSCOPE_DEPENDENCIES = perl-module-implementation perl-sub-exporter-progressive
PERL_B_HOOKS_ENDOFSCOPE_LICENSE = Artistic or GPLv1+
PERL_B_HOOKS_ENDOFSCOPE_LICENSE_FILES = README

$(eval $(perl-package))
