################################################################################
#
# perl-io-tty
#
################################################################################

PERL_IO_TTY_VERSION = 1.12
PERL_IO_TTY_SOURCE = IO-Tty-$(PERL_IO_TTY_VERSION).tar.gz
PERL_IO_TTY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
PERL_IO_TTY_LICENSE = Artistic or GPLv1+
PERL_IO_TTY_LICENSE_FILES = README

$(eval $(perl-package))
