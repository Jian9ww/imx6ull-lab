# 03 Docker Workflow

## Goal

Docker 用于提供可复现的学习和编译环境。

## Current Rules

- 容器内工作目录统一为 `/work`。
- 仓库挂载到 `/work`。
- 当前不配置串口、USB 烧录、NFS、TFTP。
- 串口调试和烧录工具优先放在宿主机。
- 不默认启用 privileged。
- 不使用 host network。

## Future Plan

后续将 Linaro 4.9.4 交叉编译工具链内置到 Docker 镜像，并把镜像 push 到镜像仓库，便于多台电脑复用。
