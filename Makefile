# [Usage]
# build project: `make build`
# run project: `make` or `make run`
# debug project: `make debug`
# clean build folder: `make clean`

# [Info]
# Project
PROJECT_NAME = hello
SOURCES = main.c # All source files of the project.
ARGUMENTS = a1 a2 a3 # The arguments of your executable, seperated by spaces.
# Build
BUILD_FOLDER = build
EXECUTABLE = ./${BUILD_FOLDER}/${PROJECT_NAME}
EXECUTABLE_DEBUG = ./${EXECUTABLE}-debug
# Tools
CC = clang
CDB = lldb # https://lldb.llvm.org/use/tutorial.html
CFLAGS = -std=c11 -W -Wall
# `-std=<value>`
#     Language standard to compile for
#     Check https://clang.llvm.org/c_status.html
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

# [Config]
.PHONY = build-debug debug build run create-folder clean 
.DEFAULT_GOAL = run
