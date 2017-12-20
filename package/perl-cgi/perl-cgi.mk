################################################################################
#
# perl-cgi
#
################################################################################

PERL_CGI_VERSION = 4.32
PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
PERL_CGI_DEPENDENCIES = perl-html-parser
PERL_CGI_LICENSE = Artistic or GPLv1+
PERL_CGI_LICENSE_FILES = LICENSE

$(eval $(perl-package))
