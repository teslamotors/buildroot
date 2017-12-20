################################################################################
#
# perl-http-server-simple
#
################################################################################

PERL_HTTP_SERVER_SIMPLE_VERSION = 0.51
PERL_HTTP_SERVER_SIMPLE_SOURCE = HTTP-Server-Simple-$(PERL_HTTP_SERVER_SIMPLE_VERSION).tar.gz
PERL_HTTP_SERVER_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPS
PERL_HTTP_SERVER_SIMPLE_DEPENDENCIES = perl-cgi
PERL_HTTP_SERVER_SIMPLE_LICENSE = Artistic or GPLv1+
PERL_HTTP_SERVER_SIMPLE_LICENSE_FILES = README

$(eval $(perl-package))
