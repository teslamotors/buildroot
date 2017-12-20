################################################################################
#
# tesla-nanomsg
#
################################################################################

TESLA_NANOMSG_VERSION = 1.0.0
TESLA_NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(TESLA_NANOMSG_VERSION))
#TESLA_NANOMSG_SOURCE = $(TESLA_NANOMSG_VERSION).tar.gz
TESLA_NANOMSG_LICENSE = MIT
TESLA_NANOMSG_INSTALL_STAGING = YES
TESLA_NANOMSG_CONF_OPTS = -DNN_STATIC_LIB=OFF  \
                    -DNN_ENABLE_DOC=OFF \
                    -DNN_TESTS=OFF      \
                    -DNN_TOOLS=OFF      \
                    -DNN_ENABLE_GETADDRINFO_A=OFF \
                    -DNN_HAVE_GETADDRINFO_A:INTERNAL=0

$(eval $(cmake-package))
