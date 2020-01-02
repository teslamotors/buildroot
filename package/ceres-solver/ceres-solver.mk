################################################################################
#
# ceres-solver
#
################################################################################

CERES_SOLVER_VERSION = 1.12.0
CERES_SOLVER_SITE = http://ceres-solver.org
CERES_SOLVER_LICENSE = BSD-3c
CERES_SOLVER_LICENSE_FILES = LICENSE
CERES_SOLVER_CONF_OPTS = -DOPENMP=OFF
CERES_SOLVER_DEPENDENCIES = openblas suitesparse gflags glog eigen

CERES_SOLVER_INSTALL_STAGING = YES

$(eval $(cmake-package))
