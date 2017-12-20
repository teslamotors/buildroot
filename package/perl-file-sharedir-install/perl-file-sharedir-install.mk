################################################################################
#
# perl-file-sharedir-install
#
################################################################################

PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.11
PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
HOST_PERL_FILE_SHAREDIR_INSTALL_DEPENDENCIES = host-perl-module-build-tiny
PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPLv1+
PERL_FILE_SHAREDIR_INSTALL_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
