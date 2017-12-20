################################################################################
#
# perl-xml-writer
#
################################################################################

PERL_XML_WRITER_VERSION = 0.625
PERL_XML_WRITER_SOURCE = XML-Writer-$(PERL_XML_WRITER_VERSION).tar.gz
PERL_XML_WRITER_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JO/JOSEPHW
PERL_XML_WRITER_LICENSE = unrestricted
PERL_XML_WRITER_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
