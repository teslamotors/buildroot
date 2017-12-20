################################################################################
#
# perl-dist-checkconflicts
#
################################################################################

PERL_DIST_CHECKCONFLICTS_VERSION = 0.11
PERL_DIST_CHECKCONFLICTS_SOURCE = Dist-CheckConflicts-$(PERL_DIST_CHECKCONFLICTS_VERSION).tar.gz
PERL_DIST_CHECKCONFLICTS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
HOST_PERL_DIST_CHECKCONFLICTS_DEPENDENCIES = host-perl-module-runtime
PERL_DIST_CHECKCONFLICTS_LICENSE = Artistic or GPLv1+
PERL_DIST_CHECKCONFLICTS_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
