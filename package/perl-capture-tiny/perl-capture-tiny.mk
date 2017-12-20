################################################################################
#
# perl-capture-tiny
#
################################################################################

PERL_CAPTURE_TINY_VERSION = 0.44
PERL_CAPTURE_TINY_SOURCE = Capture-Tiny-$(PERL_CAPTURE_TINY_VERSION).tar.gz
PERL_CAPTURE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
PERL_CAPTURE_TINY_LICENSE = Apache-2.0
PERL_CAPTURE_TINY_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
