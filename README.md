# C Makefile macOS模版

## 下载模版

模版存储在Git仓库中 实际使用需要移除当前Git管理

### 压缩包

- [GitHub](https://github.com/Yang-Xijie/C-Makefile-template/archive/refs/heads/main.zip)
- [Gitee](https://gitee.com/yang-xijie/C-Makefile-template/repository/archive/main.zip)

### Git

```sh
$ git clone https://github.com/Yang-Xijie/C-Makefile-template.git <project_name> # 使用Git克隆仓库到名为project_name的文件夹
$ cd <project_name> # 进入文件夹
$ rm -rf .git # 移除Git管理
$ rm -rf LISENSE README # (可选)删除原仓库协议和说明文档
$ git init # (可选)初始化Git仓库
```

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
