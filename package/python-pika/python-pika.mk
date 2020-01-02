################################################################################
#
# python-pika
#
################################################################################

PYTHON_PIKA_VERSION = 0.10.0
PYTHON_PIKA_SOURCE = pika-$(PYTHON_PIKA_VERSION).tar.gz
PYTHON_PIKA_SITE = https://files.pythonhosted.org/packages/ee/25/1517ce612d7cd0a426ea027275ba74165bbfd86a2daf4bce4839afac3deb
PYTHON_PIKA_SETUP_TYPE = setuptools
PYTHON_PIKA_LICENSE = BSD
PYTHON_PIKA_LICENSE_FILES = LICENSE

$(eval $(python-package))
