cmake_minimum_required (VERSION 3.4)
project (helloworld C)

set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)

add_compile_options(
	-Werror
)

set (SRC main.c)

add_executable (${PROJECT_NAME} ${SRC})
