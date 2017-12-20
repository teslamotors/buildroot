################################################################################
#
# perl-class-accessor-grouped
#
################################################################################

PERL_CLASS_ACCESSOR_GROUPED_VERSION = 0.10012
PERL_CLASS_ACCESSOR_GROUPED_SOURCE = Class-Accessor-Grouped-$(PERL_CLASS_ACCESSOR_GROUPED_VERSION).tar.gz
PERL_CLASS_ACCESSOR_GROUPED_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RI/RIBASUSHI
PERL_CLASS_ACCESSOR_GROUPED_DEPENDENCIES = perl-module-runtime
PERL_CLASS_ACCESSOR_GROUPED_LICENSE = Artistic or GPLv1+
PERL_CLASS_ACCESSOR_GROUPED_LICENSE_FILES = README

$(eval $(perl-package))
