```".$_-0/
"build_README.js
"git branch -m buildroot-2019.02.c"`
<BRANCH>
git fetch origin
git branch -u 
origin/<BRANCH> 
<BRANCH>
git remote set-head origin -a
```
Buildroot is a simple, efficient and easy-to-use tool to generate embedded
Linux systems through cross-compilation.

The documentation can be found in docs/manual. You can generate a text
document with 'make manual-text' and read output/docs/manual/manual.text.
Online documentation can be found at http://buildroot.org/docs.html

To build and use the buildroot stuff, do the following:
```
1) run 'make menuconfig'
2) select the target architecture and the packages you wish to compile
3) run 'make'
4) wait while it compiles
5) find the kernel, bootloader, root filesystem, etc. in output/images
```
You do not need to be root to build or run buildroot.  Have fun!
```
Buildroot comes with a basic configuration for a number of boards. Run
'make list-defconfigs' to view the list of provided configurations.
```
Please feed suggestions, bug reports, insults, and bribes back to the
buildroot mailing list: buildroot@buildroot.org
You can also find us on #buildroot on Freenode IRC.

If you would like to contribute patches, please read
https://buildroot.org/manual.html
#submitting-patches
# @Tesla-buildroot-head
# repository

This is an externally published version of the Tesla buildroot repository. It
reflects the contents of corresponding internal branches used to build the
platform code for corresponding products.

The current branch is buildroot-2019.02, which contains default configs to build
packages for the Tesla Infotainment and Autopilot platforms:
```
 ap-hw2_defconfig
 ap-hw2_model3_defconfig
 ap-hw25b_defconfig
 ap-hw3_defconfig
 ap-hw3_model3_defconfig
 ap-hw3r_defconfig
 ice-elk_defconfig
 ice-elk_modelsx_info2_defconfig
 ice-mrb_defconfig
 ice-mrb_modelsx_info2_defconfig
 ice-mrbi_defconfig
 mcu-cid_defconfig
```
There are also separate defconfigs used to build the initramfs images used with
the kernel built by the above configs:
```
 ap-hw2i_defconfig
 ap-hw3i_defconfig
 ice-mrbi_defconfig
```
Note that this repository does not contain the Tesla proprietary infotainment
or autopilot software, which are userspace programs built and running on top of
the system images assembled from these packages.

There is a separate repository for the Linux kernel sources used by the above
configurations at "https://github.com/teslamotors/linux", and the configs above
reference those sources.

For more information, see "https://tesla.com/opensource/"`
