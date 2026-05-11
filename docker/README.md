# Docker Development Environment

当前 `Dockerfile` 只是基础环境骨架。

基础镜像使用 `ubuntu:16.04`，原因是教程环境基于 Ubuntu 16.04。Ubuntu 16.04 是老系统，本仓库只把它作为隔离的学习和编译容器使用。

当前阶段不配置交叉编译工具链。

后续计划将教程使用的 Linaro 4.9.4 工具链内置到 Docker 镜像中，而不是把工具链压缩包提交到 Git。

推荐后续把构建好的 Docker 镜像 push 到镜像仓库。最终目标是新电脑只需要：

1. `git clone`
2. `docker compose pull`
3. `docker compose run --rm dev`

即可进入一致的开发环境。
