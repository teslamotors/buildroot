################################################################################
#
# perl-context-preserve
#
################################################################################

PERL_CONTEXT_PRESERVE_VERSION = 0.01
PERL_CONTEXT_PRESERVE_SOURCE = Context-Preserve-$(PERL_CONTEXT_PRESERVE_VERSION).tar.gz
PERL_CONTEXT_PRESERVE_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROCKWAY
PERL_CONTEXT_PRESERVE_LICENSE_FILES = README

$(eval $(perl-package))
