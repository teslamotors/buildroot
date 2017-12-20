################################################################################
#
# perl-dbd-sqlite
#
################################################################################

PERL_DBD_SQLITE_VERSION = 1.50
PERL_DBD_SQLITE_SOURCE = DBD-SQLite-$(PERL_DBD_SQLITE_VERSION).tar.gz
PERL_DBD_SQLITE_SITE = $(BR2_CPAN_MIRROR)/authors/id/I/IS/ISHIGAKI
HOST_PERL_DBD_SQLITE_DEPENDENCIES = host-perl-dbi
PERL_DBD_SQLITE_DEPENDENCIES = host-perl-dbi perl-dbi
PERL_DBD_SQLITE_LICENSE = Artistic or GPLv1+
PERL_DBD_SQLITE_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
