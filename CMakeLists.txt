cmake_minimum_required (VERSION 3.4)
project (helloworld C)
set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)


add_compile_options(
	-Werror
	--target=${triple}
	-B${LIBS}
	-v
)

set (SRC hello.c)

add_executable (${PROJECT_NAME} ${SRC})
