################################################################################
#
# perl-class-inspector
#
################################################################################

PERL_CLASS_INSPECTOR_VERSION = 1.28
PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).tar.gz
PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPLv1+
PERL_CLASS_INSPECTOR_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
