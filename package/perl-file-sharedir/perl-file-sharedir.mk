################################################################################
#
# perl-file-sharedir
#
################################################################################

PERL_FILE_SHAREDIR_VERSION = 1.102
PERL_FILE_SHAREDIR_SOURCE = File-ShareDir-$(PERL_FILE_SHAREDIR_VERSION).tar.gz
PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
HOST_PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-class-inspector host-perl-file-sharedir-install
PERL_FILE_SHAREDIR_LICENSE = Artistic or GPLv1+

$(eval $(host-perl-package))
$(eval $(perl-package))
