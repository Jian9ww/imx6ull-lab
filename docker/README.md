# Docker Development Environment

当前 `Dockerfile` 基于 `ubuntu:16.04`，并在构建时内置教程使用的 Linaro 4.9.4 交叉编译工具链。

基础镜像使用 `ubuntu:16.04`，原因是教程环境基于 Ubuntu 16.04。Ubuntu 16.04 是老系统，本仓库只把它作为隔离的学习和编译容器使用。

## Toolchain Archive

构建镜像前，需要手动把教程使用的工具链压缩包放到：

```text
docker/assets/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz
```

该压缩包不会提交 Git，`.gitignore` 会忽略 `docker/assets/*`，只保留 `docker/assets/README.md`。

不要使用 Ubuntu apt 源里的 `gcc-arm-linux-gnueabihf`、`g++-arm-linux-gnueabihf` 或 `binutils-arm-linux-gnueabihf`，避免和教程指定工具链混用。

## Build Image

Docker Compose v2:

```bash
docker compose build dev
```

旧版 Docker Compose:

```bash
docker-compose build dev
```

## Enter Container

推荐使用脚本：

```bash
./scripts/devshell.sh
```

也可以直接执行：

```bash
docker compose run --rm dev
```

## Verify Toolchain

进入容器后执行：

```bash
./scripts/check_toolchain.sh
```

该脚本会检查：

- `arm-linux-gnueabihf-gcc`
- `arm-linux-gnueabihf-ld`
- `arm-linux-gnueabihf-objcopy`
- `arm-linux-gnueabihf-objdump`

推荐后续把构建好的 Docker 镜像 push 到镜像仓库。最终目标是新电脑只需要：

1. `git clone`
2. `docker compose pull`
3. `docker compose run --rm dev`

即可进入一致的开发环境。
