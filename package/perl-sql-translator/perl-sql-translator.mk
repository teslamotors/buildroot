################################################################################
#
# perl-sql-translator
#
################################################################################

PERL_SQL_TRANSLATOR_VERSION = 0.11021
PERL_SQL_TRANSLATOR_SOURCE = SQL-Translator-$(PERL_SQL_TRANSLATOR_VERSION).tar.gz
PERL_SQL_TRANSLATOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/I/IL/ILMARI
HOST_PERL_SQL_TRANSLATOR_DEPENDENCIES = host-perl-carp-clan host-perl-dbi host-perl-file-sharedir host-perl-json host-perl-list-moreutils host-perl-moo host-perl-package-variant host-perl-parse-recdescent host-perl-try-tiny host-perl-xml-writer host-perl-yaml
PERL_SQL_TRANSLATOR_LICENSE = Artistic or GPLv1+
PERL_SQL_TRANSLATOR_LICENSE_FILES = README

$(eval $(host-perl-package))
$(eval $(perl-package))
