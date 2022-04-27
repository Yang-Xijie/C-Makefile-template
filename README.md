# C Makefile macOS模版

## 使用

### 命令行

- 构建项目: `make build`
    - 确保项目能够成功编译
- 运行项目: `make` 或 `make run`
- 调试项目: `make debug`
- 清空构建文件: `make clean`

### VSCode

- 运行项目: ⇧⌘B
- 调试项目: F5

## 自定义项

- 项目名称
    - Makefile > PROJECT_NAME
- 源文件
    - Makefile > SOURCES
- 程序运行需要的参数
    - Makefile > ARGUMENTS
    - .vscode/launch.json > configurations > args
