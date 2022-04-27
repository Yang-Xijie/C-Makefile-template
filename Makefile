# [Usage]
# build project: `make build`
# run project: `make` or `make run`
# debug project: `make debug`
# clean the build folder: `make clean`

# [Config]
.PHONY = run build debug clean
.DEFAULT_GOAL = run

# [Info]
# Project
PROJECT_NAME = hello
SOURCES = main.c func.c
ARGUMENTS = p1 p2 p3
# Build
BUILD_FOLDER = build
EXECUTABLE = ./${BUILD_FOLDER}/${PROJECT_NAME}
EXECUTABLE_DEBUG = ./${BUILD_FOLDER}/${PROJECT_NAME}-debug
# Tools
CC = clang
CDB = lldb
CFLAGS = -std=c11 -W -Wall
# `-std=<value>`
#     Language standard to compile for
# `-g`
#     Generate source-level debug information
# `-W -Wall`
#     "Put -W -Wall in your build flags. The Clang devs will take care of making sure this is a sensible warning level for all codebases, including yours." -- https://quuxplusone.github.io/blog/2018/12/06/dont-use-weverything/
# `-O2`
#     "-O2 is a moderate level of optimization which enables most optimizations." -- https://stackoverflow.com/a/21450534/14298786

# [Target]
# Debug
build-debug: create-folder ${SOURCES}
	@${CC} ${SOURCES} -o ${EXECUTABLE_DEBUG} ${CFLAGS} -g 
debug: build-debug
	@${CDB} ${EXECUTABLE_DEBUG}
# Release
build: create-folder ${SOURCES}
	@${CC} ${SOURCES} -o ${EXECUTABLE} ${CFLAGS} -O2
run: build
	@${EXECUTABLE} ${ARGUMENTS}
# Others
create-folder:
	@mkdir -p ${BUILD_FOLDER}
clean:
	@rm -rf ${BUILD_FOLDER}
