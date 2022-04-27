# [TODO]
# - 添加`int main()`的自定义参数
# - 添加其他的头文件和源文件

# [Usage]
# run your code: `make` or `make run`
# debug your code: `make debug`

# [Info]
PROJECT_NAME = hello
SOURCES = main.c
EXECUTABLE = ${PROJECT_NAME}
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
BUILD_FOLDER = build

# [Config]
# .PHONY = build run clean
.DEFAULT_GOAL = run

# [Target]
create-folder:
	@mkdir -p ${BUILD_FOLDER}
# Debug
build-debug: create-folder ${SOURCES}
	@${CC} ${SOURCES} -o ${BUILD_FOLDER}/${EXECUTABLE}-debug ${CFLAGS} -g 
debug: build-debug
	@${CDB} ${BUILD_FOLDER}/${EXECUTABLE}-debug

# Release
build: create-folder
	@${CC} ${SOURCES} -o ${BUILD_FOLDER}/${EXECUTABLE} ${CFLAGS} -O2
run: build
	@./${BUILD_FOLDER}/${EXECUTABLE}

clean:
	@rm -rf ${BUILD_FOLDER}
