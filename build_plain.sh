#!/usr/bin/env bash
# To avoid manually re-run things, run this in another shell:
#   find . -maxdepth 1 -name "*.txt" -o -name "*.sh" | entr -c ./build_plain.sh
export PATH=/media/jbech/TSHB_LINUX/devel/llvm-project/build_v9/bin:$PATH

cd /media/jbech/TSHB_LINUX/devel/cmake-helloworld

# Full path to reduce likelihood of rm -rf the wrong stuff.
rm -f /media/jbech/TSHB_LINUX/devel/cmake-helloworld/*.o
rm -f /media/jbech/TSHB_LINUX/devel/cmake-helloworld/helloworld
clear

GCC_PATH=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32
TRIPLET=armv7a-linux-gnueabihf
SYSROOT=${GCC_PATH}/arm-none-linux-gnueabihf/libc
LIBS=${GCC_PATH}/lib/gcc/arm-none-linux-gnueabihf/9.2.1

clang \
	-target ${TRIPLET} \
	-fuse-ld=lld \
	-lc \
	--sysroot=${SYSROOT} \
	-L${LIBS} \
	-B${LIBS} \
	main.c \
	-o helloworld

echo -e "\nFile type:\n=========="
file helloworld

echo -e "\nRunning:\n=========="
qemu-arm -L ${SYSROOT} helloworld
