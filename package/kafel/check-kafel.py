
from __future__ import print_function
import os
import sys
from cffi import FFI

HOST_DIR = os.environ.get("HOST_DIR")
TARGET_DIR = os.environ.get('TARGET_DIR')
INCLUDE_PATHS = [TARGET_DIR+"/etc/kafel/include"]

ffi = FFI()
ffi.cdef("""

/*
   Kafel
   -----------------------------------------

   Copyright 2016 Google Inc. All Rights Reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/

struct sock_filter {    /* Filter block */
        short   code;   /* Actual filter code */
        char    jt;     /* Jump true */
        char    jf;     /* Jump false */
        long   k;      /* Generic multiuse field */
};

struct sock_fprog {     /* Required for SO_ATTACH_FILTER. */
        unsigned short     len;    /* Number of filter blocks */
        struct sock_filter *filter;
};

typedef struct kafel_ctxt* kafel_ctxt_t;
kafel_ctxt_t kafel_ctxt_create(void);
void kafel_ctxt_destroy(kafel_ctxt_t* ctxt);
void kafel_set_input_file(kafel_ctxt_t ctxt, FILE* file);
void kafel_set_target_arch(kafel_ctxt_t ctxt, uint32_t target_arch);
void kafel_add_include_search_path(kafel_ctxt_t ctxt, const char* path);
int kafel_compile(kafel_ctxt_t ctxt, struct sock_fprog* prog);
int kafel_compile_file(FILE* file, struct sock_fprog* prog);
int kafel_compile_string(const char* source, struct sock_fprog* prog);
const char* kafel_error_msg(const kafel_ctxt_t ctxt);

""")


# import libkafel on the host
libkafel = ffi.dlopen(HOST_DIR+"/usr/lib/libkafel.so")

kafel_failures = []

# for each kafel file in the target dir, attempt to compile it. exit if there is a failure
for root, dirs, files in os.walk(TARGET_DIR):
    for file in files:
        # if its kafel. Don't check includes - they get checked by virtue of being included
        if file.endswith(".kafel") and root not in INCLUDE_PATHS:
            print("Checking", file)

            # create the context
            ctxt = libkafel.kafel_ctxt_create()
            ctxt_ptr = ffi.new("kafel_ctxt_t *", ctxt)

            # define include search paths
            for p in INCLUDE_PATHS:
                searchpath = ffi.new("char []", str.encode(p))
                libkafel.kafel_add_include_search_path(ctxt, searchpath)

            # Add the cwd into the include path
            cwd = ffi.new("char []", str.encode(root))
            libkafel.kafel_add_include_search_path(ctxt, cwd)

            # create new filter obj
            prog = ffi.new("struct sock_fprog *")

            with open(os.path.join(root, file)) as f:
                # aim teh lazor
                libkafel.kafel_set_input_file(ctxt, f)
                # firin mah lazor
                rv = libkafel.kafel_compile(ctxt, prog)

            if rv != 0:
                kafel_failures.append("Error in {} : {}".format(
                    file,
                    ffi.string(libkafel.kafel_error_msg(ctxt)).decode("utf-8")
                ))

            # cleanup
            libkafel.kafel_ctxt_destroy(ctxt_ptr)

if kafel_failures:
    # one or more errors detected, exit with 1
    print("** ERROR COMPILING KAFEL PROFILE **")
    print("** PLEASE CHECK THE FILE(S) BELOW AND MAKE APPROPRIATE CORRECTIONS **")
    print("** FOR HELP UNDERSTANDING FAILURES, PLEASE CONTACT YOUR FRIENDLY PRODSEC TEAM **")
    print("\n".join(kafel_failures))
    sys.exit(1)
else:
    # exit with 0, no issues detected
    print("All Seccomp Policies Compiled Successfully!")
    sys.exit(0)
