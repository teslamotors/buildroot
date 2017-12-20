################################################################################
#
# perl-devel-globaldestruction
#
################################################################################

PERL_DEVEL_GLOBALDESTRUCTION_VERSION = 0.13
PERL_DEVEL_GLOBALDESTRUCTION_SOURCE = Devel-GlobalDestruction-$(PERL_DEVEL_GLOBALDESTRUCTION_VERSION).tar.gz
PERL_DEVEL_GLOBALDESTRUCTION_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
PERL_DEVEL_GLOBALDESTRUCTION_DEPENDENCIES = perl-sub-exporter-progressive
PERL_DEVEL_GLOBALDESTRUCTION_LICENSE = Artistic or GPLv1+
PERL_DEVEL_GLOBALDESTRUCTION_LICENSE_FILES = README

$(eval $(perl-package))
