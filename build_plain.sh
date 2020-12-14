#!/usr/bin/env bash
# find . -maxdepth 1 -name "*.txt" -o -name "*.sh" | entr -c ./build.sh
export PATH=/media/jbech/TSHB_LINUX/devel/llvm-project/build_v9/bin:$PATH

cd /media/jbech/TSHB_LINUX/devel/cmake-helloworld
rm -f /media/jbech/TSHB_LINUX/devel/cmake-helloworld/*.o
rm -f /media/jbech/TSHB_LINUX/devel/cmake-helloworld/helloworld
clear
#cmake .. && make && file helloworld
#CC='clang' 

TRIPLET=armv7a-linux-gnueabihf

SYSROOT=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32/arm-none-linux-gnueabihf/libc

#GCCTOOLCHAIN=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32
GCCTOOLCHAIN=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32/bin
#GCCTOOLCHAIN=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32/lib/gcc/arm-none-linux-gnueabihf

LIBS=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32/lib/gcc/arm-none-linux-gnueabihf/9.2.1

INCLUDES=/media/jbech/TSHB_LINUX/devel/optee_projects/reference/toolchains/aarch32/arm-none-linux-gnueabihf/libc/usr/include

FLAGS=

clang \
	-v \
	-target ${TRIPLET} \
	-march=armv7-a \
	-mfloat-abi=hard \
	-fuse-ld=lld \
	-nostdlib \
	-lc \
	-lgcc \
	--sysroot=${SYSROOT} \
	--gcc-toolchain=${GCCTOOLCHAIN} \
	-L${LIBS} \
	-I${INCLUDES} \
	main.c \
	-o helloworld

echo -e "\nFile type:\n=========="
file helloworld
