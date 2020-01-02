################################################################################
#
# tesla_avb_boost
#
################################################################################

TESLA_AVB_BOOST_VERSION = 1.65.0
TESLA_AVB_BOOST_SOURCE = boost_$(subst .,_,$(TESLA_AVB_BOOST_VERSION)).tar.bz2
TESLA_AVB_BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(TESLA_AVB_BOOST_VERSION)
TESLA_AVB_BOOST_INSTALL_STAGING = NO
TESLA_AVB_BOOST_LICENSE = Boost Software License 1.0
TESLA_AVB_BOOST_LICENSE_FILES = LICENSE_1_0.txt

HOST_TESLA_AVB_BOOST_DEPENDENCIES =

# keep host variant as minimal as possible
HOST_TESLA_AVB_BOOST_FLAGS = --without-icu \
	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
	coroutine date_time exception filesystem graph \
	graph_parallel iostreams locale log math mpi program_options python \
	random regex serialization signals system test thread timer wave)

TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_ATOMIC),,atomic)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_CHRONO),,chrono)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_CONTAINER),,container)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_CONTEXT),,context)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_COROUTINE),,coroutine)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_DATE_TIME),,date_time)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_EXCEPTION),,exception)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_FILESYSTEM),,filesystem)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_GRAPH),,graph)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_GRAPH_PARALLEL),,graph_parallel)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_IOSTREAMS),,iostreams)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_LOCALE),,locale)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_LOG),,log)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_MATH),,math)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_MPI),,mpi)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_PROGRAM_OPTIONS),,program_options)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_PYTHON),,python)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_RANDOM),,random)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_REGEX),,regex)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_SERIALIZATION),,serialization)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_SIGNALS),,signals)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_SYSTEM),,system)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_TEST),,test)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_THREAD),,thread)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_TIMER),,timer)
TESLA_AVB_BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_TESLA_AVB_BOOST_WAVE),,wave)

TESLA_AVB_BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_PACKAGE_ICU),y)
TESLA_AVB_BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
TESLA_AVB_BOOST_DEPENDENCIES += icu
else
TESLA_AVB_BOOST_FLAGS += --without-icu
endif

ifeq ($(BR2_PACKAGE_TESLA_AVB_BOOST_IOSTREAMS),y)
TESLA_AVB_BOOST_DEPENDENCIES += bzip2 zlib
endif

ifeq ($(BR2_PACKAGE_TESLA_AVB_BOOST_PYTHON),y)
TESLA_AVB_BOOST_FLAGS += --with-python-root=$(HOST_DIR)
ifeq ($(BR2_PACKAGE_PYTHON3),y)
TESLA_AVB_BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)
TESLA_AVB_BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
TESLA_AVB_BOOST_DEPENDENCIES += python3
else
TESLA_AVB_BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)
TESLA_AVB_BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
TESLA_AVB_BOOST_DEPENDENCIES += python
endif
endif

HOST_TESLA_AVB_BOOST_OPTS += toolset=gcc threading=multi variant=release link=shared \
	runtime-link=shared

ifeq ($(BR2_MIPS_OABI32),y)
TESLA_AVB_BOOST_ABI = o32
else ifeq ($(BR2_arm),y)
TESLA_AVB_BOOST_ABI = aapcs
else
TESLA_AVB_BOOST_ABI = sysv
endif

TESLA_AVB_BOOST_OPTS += toolset=gcc \
	     threading=multi \
	     abi=$(TESLA_AVB_BOOST_ABI) \
	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)

ifeq ($(BR2_sparc64),y)
TESLA_AVB_BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
endif

ifeq ($(BR2_sparc),y)
TESLA_AVB_BOOST_OPTS += architecture=sparc instruction-set=v8
endif

# By default, Tesla_Avb_Boost build and installs both the shared and static
# variants. Override that if we want static only or shared only.
ifeq ($(BR2_STATIC_LIBS),y)
TESLA_AVB_BOOST_OPTS += link=static runtime-link=static
else ifeq ($(BR2_SHARED_LIBS),y)
TESLA_AVB_BOOST_OPTS += link=shared runtime-link=shared
endif

ifeq ($(BR2_PACKAGE_TESLA_AVB_BOOST_LOCALE),y)
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
# posix backend needs monetary.h which isn't available on uClibc
TESLA_AVB_BOOST_OPTS += tesla_avb_boost.locale.posix=off
endif

TESLA_AVB_BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
endif

TESLA_AVB_BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(TESLA_AVB_BOOST_WITHOUT_FLAGS)))
TESLA_AVB_BOOST_FLAGS += $(if $(TESLA_AVB_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(TESLA_AVB_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
TESLA_AVB_BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_TESLA_AVB_BOOST_LAYOUT))

# how verbose should the build be?
TESLA_AVB_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
HOST_TESLA_AVB_BOOST_OPTS += $(if $(QUIET),-d,-d+1)

define TESLA_AVB_BOOST_CONFIGURE_CMDS
	(cd $(@D) && $(LOGLINEAR) ./bootstrap.sh $(TESLA_AVB_BOOST_FLAGS))
	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(TESLA_AVB_BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
	echo "" >> $(@D)/user-config.jam
endef

define TESLA_AVB_BOOST_BUILD_CMDS
	(cd $(@D) && $(LOGLINEAR) ./bjam -j$(PARALLEL_JOBS) -q \
	--user-config=$(@D)/user-config.jam \
	$(TESLA_AVB_BOOST_OPTS) \
	--ignore-site-config \
	--layout=$(TESLA_AVB_BOOST_LAYOUT))
endef

define TESLA_AVB_BOOST_INSTALL_TARGET_CMDS
	(cd $(@D) && $(LOGLINEAR) ./b2 -j$(PARALLEL_JOBS) -q \
	--user-config=$(@D)/user-config.jam \
	$(TESLA_AVB_BOOST_OPTS) \
	--prefix=$(TARGET_DIR)/$(BR2_PACKAGE_TESLA_AVB_BOOST_INSTALL_PREFIX) \
	--ignore-site-config \
	--layout=$(TESLA_AVB_BOOST_LAYOUT) install )
	rm -rf $(TARGET_DIR)/$(BR2_PACKAGE_TESLA_AVB_BOOST_INSTALL_PREFIX)/include
	rm -f $(TARGET_DIR)/$(BR2_PACKAGE_TESLA_AVB_BOOST_INSTALL_PREFIX)/lib/*.a
endef

define TESLA_AVB_BOOST_INSTALL_STAGING_CMDS
	(cd $(@D) && $(LOGLINEAR) ./bjam -j$(PARALLEL_JOBS) -q \
	--user-config=$(@D)/user-config.jam \
	$(TESLA_AVB_BOOST_OPTS) \
	--prefix=$(STAGING_DIR)/$(BR2_PACKAGE_TESLA_AVB_BOOST_INSTALL_PREFIX) \
	--ignore-site-config \
	--layout=$(TESLA_AVB_BOOST_LAYOUT) install)
endef

define HOST_TESLA_AVB_BOOST_CONFIGURE_CMDS
	(cd $(@D) && $(LOGLINEAR) ./bootstrap.sh $(HOST_TESLA_AVB_BOOST_FLAGS))
	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
	echo "" >> $(@D)/user-config.jam
endef

define HOST_TESLA_AVB_BOOST_BUILD_CMDS
	(cd $(@D) && $(LOGLINEAR) ./b2 -j$(PARALLEL_JOBS) -q \
	--user-config=$(@D)/user-config.jam \
	$(HOST_TESLA_AVB_BOOST_OPTS) \
	--ignore-site-config \
	--prefix=$(HOST_DIR)/usr )
endef

define HOST_TESLA_AVB_BOOST_INSTALL_CMDS
	(cd $(@D) && $(LOGLINEAR) ./b2 -j$(PARALLEL_JOBS) -q \
	--user-config=$(@D)/user-config.jam \
	$(HOST_TESLA_AVB_BOOST_OPTS) \
	--prefix=$(HOST_DIR)/usr \
	--ignore-site-config \
	--layout=$(TESLA_AVB_BOOST_LAYOUT) install )
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
