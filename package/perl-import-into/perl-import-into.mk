################################################################################
#
# perl-import-into
#
################################################################################

PERL_IMPORT_INTO_VERSION = 1.002005
PERL_IMPORT_INTO_SOURCE = Import-Into-$(PERL_IMPORT_INTO_VERSION).tar.gz
PERL_IMPORT_INTO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
HOST_PERL_IMPORT_INTO_DEPENDENCIES = host-perl-module-runtime
PERL_IMPORT_INTO_LICENSE = Artistic or GPLv1+
PERL_IMPORT_INTO_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
