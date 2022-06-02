################################################################################
#
# go_1_16
#
################################################################################

GO_1_16_VERSION = 1.16.13
GO_1_16_SITE = https://storage.googleapis.com/golang
GO_1_16_SOURCE = go$(GO_1_16_VERSION).src.tar.gz

GO_1_16_LICENSE = BSD-3-Clause
GO_1_16_LICENSE_FILES = LICENSE

HOST_GO_1_16_DEPENDENCIES = host-go-bootstrap
HOST_GO_1_16_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-1-16-cache
HOST_GO_1_16_ROOT = $(HOST_DIR)/lib/go-1-16
HOST_GO_1_16_TARGET_CACHE = $(HOST_DIR)/usr/share/go-1-16-cache

ifeq ($(BR2_PACKAGE_HOST_GO_1_16_TARGET_ARCH_SUPPORTS),y)

ifeq ($(BR2_arm),y)
GO_1_16_GOARCH = arm
ifeq ($(BR2_ARM_CPU_ARMV5),y)
GO_1_16_GOARM = 5
else ifeq ($(BR2_ARM_CPU_ARMV6),y)
GO_1_16_GOARM = 6
else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
GO_1_16_GOARM = 7
endif
else ifeq ($(BR2_aarch64),y)
GO_1_16_GOARCH = arm64
else ifeq ($(BR2_i386),y)
GO_1_16_GOARCH = 386
else ifeq ($(BR2_x86_64),y)
GO_1_16_GOARCH = amd64
else ifeq ($(BR2_powerpc64),y)
GO_1_16_GOARCH = ppc64
else ifeq ($(BR2_powerpc64le),y)
GO_1_16_GOARCH = ppc64le
else ifeq ($(BR2_mips64),y)
GO_1_16_GOARCH = mips64
else ifeq ($(BR2_mips64el),y)
GO_1_16_GOARCH = mips64le
endif

# For the convienience of target packages.
HOST_GO_1_16_TOOLDIR = $(HOST_GO_1_16_ROOT)/pkg/tool/linux_$(GO_1_16_GOARCH)
HOST_GO_1_16_TARGET_ENV = \
	GO111MODULE=off \
	GOARCH=$(GO_1_16_GOARCH) \
	GOCACHE="$(HOST_GO_1_16_TARGET_CACHE)" \
	GOROOT="$(HOST_GO_1_16_ROOT)" \
	CGO_ENABLED=$(HOST_GO_1_16_CGO_ENABLED) \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)" \
	GOTOOLDIR="$(HOST_GO_1_16_TOOLDIR)"

# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
# set, build in cgo support for any go programs that may need it.  Note that
# any target or host package needing cgo support must include
# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
HOST_GO_1_16_CGO_ENABLED = 1
else
HOST_GO_1_16_CGO_ENABLED = 0
endif

HOST_GO_1_16_CROSS_ENV = \
	CC_FOR_TARGET="$(TARGET_CC)" \
	CXX_FOR_TARGET="$(TARGET_CXX)" \
	GOARCH=$(GO_1_16_GOARCH) \
	$(if $(GO_1_16_GOARM),GOARM=$(GO_1_16_GOARM)) \
	GO_1_16_ASSUME_CROSSCOMPILING=1

else # !BR2_PACKAGE_HOST_GO_1_16_TARGET_ARCH_SUPPORTS
# host-go can still be used to build packages for the host. No need to set all
# the arch stuff since we will not be cross-compiling.
HOST_GO_1_16_CGO_ENABLED = 1
endif # BR2_PACKAGE_HOST_GO_1_16_TARGET_ARCH_SUPPORTS

# The go build system is not compatible with ccache, so use
# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
HOST_GO_1_16_MAKE_ENV = \
	GO111MODULE=off \
	GOCACHE=$(HOST_GO_1_16_HOST_CACHE) \
	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
	GOROOT_FINAL=$(HOST_GO_1_16_ROOT) \
	GOROOT="$(@D)" \
	CGO_ENABLED=$(HOST_GO_1_16_CGO_ENABLED) \
	GOBIN="$(@D)/bin" \
	GOOS=linux \
	CC=$(HOSTCC_NOCCACHE) \
	CXX=$(HOSTCXX_NOCCACHE) \
	CGO_ENABLED=$(HOST_GO_1_16_CGO_ENABLED) \
	$(HOST_GO_1_16_CROSS_ENV)

define HOST_GO_1_16_BUILD_CMDS
	cd $(@D)/src && \
		$(HOST_GO_1_16_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
endef

define HOST_GO_1_16_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_1_16_ROOT)/bin/go_1_16
	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_1_16_ROOT)/bin/gofmt_1_16

	ln -sf ../lib/go-1-16/bin/go_1_16 $(HOST_DIR)/bin/
	ln -sf ../lib/go-1-16/bin/gofmt_1_16 $(HOST_DIR)/bin/

	cp -a $(@D)/lib $(HOST_GO_1_16_ROOT)/

	mkdir -p $(HOST_GO_1_16_ROOT)/pkg
	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_1_16_ROOT)/pkg/
	cp -a $(@D)/pkg/tool $(HOST_GO_1_16_ROOT)/pkg/

	# There is a known issue which requires the go sources to be installed
	# https://golang.org/issue/2775
	cp -a $(@D)/src $(HOST_GO_1_16_ROOT)/

	# Set all file timestamps to prevent the go compiler from rebuilding any
	# built in packages when programs are built.
	find $(HOST_GO_1_16_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
endef

$(eval $(host-generic-package))
