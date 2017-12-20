################################################################################
#
# perl-yaml
#
################################################################################

PERL_YAML_VERSION = 1.18
PERL_YAML_SOURCE = YAML-$(PERL_YAML_VERSION).tar.gz
PERL_YAML_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TINITA
PERL_YAML_LICENSE = Artistic or GPLv1+
PERL_YAML_LICENSE_FILES = LICENSE

$(eval $(host-perl-package))
$(eval $(perl-package))
