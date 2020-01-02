################################################################################
#
# google-benchmark
#
################################################################################

GOOGLE_BENCHMARK_VERSION = v1.4.1
GOOGLE_BENCHMARK_SITE = $(call github,google,benchmark,$(GOOGLE_BENCHMARK_VERSION))
GOOGLE_BENCHMARK_LICENSE = Apache-2.0
GOOGLE_BENCHMARK_LICENSE_FILES = LICENSE
GOOGLE_BENCHMARK_INSTALL_STAGING = YES
GOOGLE_BENCHMARK_INSTALL_TARGET = YES
GOOGLE_BENCHMARK_CONF_OPTS = -DBENCHMARK_ENABLE_GTEST_TESTS=OFF

$(eval $(cmake-package))
