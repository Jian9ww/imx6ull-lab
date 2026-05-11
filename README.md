# i.MX6ULL Embedded Linux Lab

这是一个 i.MX6ULL 嵌入式 Linux 学习仓库，用于从零记录环境、代码、笔记、调试日志和复盘材料。

## Workflow

推荐工作流是：

Host + VSCode/Codex + Docker + Git + i.MX6ULL 开发板

- Git 保存代码和文档。
- Docker 镜像保存可复现开发环境。
- i.MX6ULL 开发板负责真实运行和验证。
- Codex 辅助生成骨架、review、debug 和整理文档。

当前第二阶段开始配置 Docker 内置 Linaro 4.9.4 交叉编译工具链，但仍不开始写教程实验代码。

后续会逐章在 `chapters/` 下创建 `chXX_xxx` 目录。

## Large Files Policy

以下内容不进入 Git：

- 大 PDF / DOCX 教程资料。
- 工具链压缩包。
- Linux Kernel 源码。
- rootfs。
- 烧录镜像。
- SDK。
- 本地临时构建产物。

本地大资源统一放在 `local/` 或 `docker/assets/` 下，并由 `.gitignore` 忽略。

## Docker Status

Docker 基础镜像暂定为 `ubuntu:16.04`，因为教程开发环境是 Ubuntu 16.04。

当前 `docker/Dockerfile` 会从 `docker/assets/` 复制教程使用的 Linaro 4.9.4 工具链压缩包并内置到镜像中。工具链压缩包不提交 Git。

## Recommended Daily Flow

1. `git pull`
2. 用 VSCode/Codex 修改代码和文档
3. 进入 Docker 环境
4. 编译
5. `scp` 到开发板
6. 在开发板运行
7. 记录日志
8. Codex review
9. `git commit`
