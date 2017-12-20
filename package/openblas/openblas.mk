################################################################################
#
# openblas
#
################################################################################

OPENBLAS_VERSION = 0.2.19
OPENBLAS_SOURCE = v$(OPENBLAS_VERSION).tar.gz
OPENBLAS_SITE = http://github.com/xianyi/OpenBLAS/archive
OPENBLAS_LICENSE = BSD-3c
OPENBLAS_LICENSE_FILES = LICENSE

OPENBLAS_INSTALL_STAGING = YES

# Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)                                                                    
OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)

# Enable cross-compiling                                                                                                          
OPENBLAS_MAKE_OPTS += CROSS=1

# Tesla: Disable OpenMP

OPENBLAS_MAKE_OPTS += USE_OPENMP=0

# Tesla: Disable threading

OPENBLAS_MAKE_OPTS += USE_THREAD=0

# Set OpenBLAS target                                                                                                             
OPENBLAS_MAKE_OPTS += TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET)

# Static-only/Shared-only toggle                                                                                                  
ifeq ($(BR2_STATIC_LIBS),y)
OPENBLAS_MAKE_OPTS += NO_SHARED=1
else ifeq ($(BR2_SHARED_LIBS),y)
OPENBLAS_MAKE_OPTS += NO_STATIC=1
endif

define OPENBLAS_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
                -C $(@D)
endef

define OPENBLAS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
                -C $(@D) install PREFIX=$(STAGING_DIR)/usr
endef

define OPENBLAS_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
endef

$(eval $(generic-package))
