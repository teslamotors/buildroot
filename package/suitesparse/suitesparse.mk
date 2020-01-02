################################################################################
#
# suitesparse
#
################################################################################

SUITESPARSE_VERSION = 4.5.1
SUITESPARSE_SOURCE = SuiteSparse-$(SUITESPARSE_VERSION).tar.gz
SUITESPARSE_SITE = http://faculty.cse.tamu.edu/davis/SuiteSparse
SUITESPARSE_LICENSE = LGPLv2.1, Apache-2.0, GPLv2, BSD-2c
SUITESPARSE_LICENSE_FILES  = CAMD/Doc/License
SUITESPARSE_LICENSE_FILES += RBio/Doc/License.txt
SUITESPARSE_LICENSE_FILES += AMD/Doc/License.txt
SUITESPARSE_LICENSE_FILES += CXSparse/Doc/License.txt
SUITESPARSE_LICENSE_FILES += UMFPACK/Doc/License
SUITESPARSE_LICENSE_FILES += CXSparse_newfiles/Doc/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Supernodal/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Core/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Modify/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Tcov/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Valgrind/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/MATLAB/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Include/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/MatrixOps/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Check/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Cholesky/License.txt
SUITESPARSE_LICENSE_FILES += CHOLMOD/Partition/License.txt
SUITESPARSE_LICENSE_FILES += CSparse/Doc/License.txt
SUITESPARSE_DEPENDENCIES = metis openblas

# SuiteSparse make invocation.
SUITESPARSE_mi = cd $(@D) && LDFLAGS=$(TARGET_LDFLAGS) $(MAKE) INSTALL=$(TARGET_DIR) CFOPENMP= LAPACK=-lopenblas BLAS=-lopenblas RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) F77=$(TARGET_FC) CC=$(TARGET_CC) CXX=$(TARGET_CXX) MY_METIS_LIB=-lmetis CUDA=no $1

define SUITESPARSE_CONFIGURE_CMDS
	$(call SUITESPARSE_mi,config)
endef

define SUITESPARSE_BUILD_CMDS
	$(call SUITESPARSE_mi,library)
endef

define SUITESPARSE_INSTALL_TARGET_CMDS
	$(call SUITESPARSE_mi,install)
endef

define SUITESPARSE_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/share/doc/suitesparse*
endef

SUITESPARSE_POST_INSTALL_TARGET_HOOKS += SUITESPARSE_INSTALL_TARGET_FIXUP

$(eval $(generic-package))
