# Docker Development Environment

当前 `Dockerfile` 基于 `ubuntu:16.04`，并在构建时内置教程使用的 Linaro 4.9.4 交叉编译工具链。

基础镜像使用 `ubuntu:16.04`，原因是教程环境基于 Ubuntu 16.04。Ubuntu 16.04 是老系统，本仓库只把它作为隔离的学习和编译容器使用。

`docker-compose.yml` 当前使用的镜像名是：

```text
ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

本机已经构建并验证过的本地镜像原名是：

```text
imx6ull-dev:base
```

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

## Push Image To GHCR

推送前先给本地镜像打 tag：

```bash
docker tag imx6ull-dev:base ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

登录 GitHub Container Registry：

```bash
echo "<GITHUB_PAT>" | docker login ghcr.io -u Jian9ww --password-stdin
```

不要把 GitHub token 写入任何文件，不要提交 token，不要把它放进 shell 脚本或 README 的真实内容中。

推送镜像：

```bash
docker push ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

不要提交 `docker/assets/` 下的工具链压缩包。该压缩包只用于本地构建镜像，镜像推送后新电脑应优先通过 `docker compose pull` 复用环境。

## Enter Container

推荐使用脚本：

```bash
./scripts/devshell.sh
```

也可以直接执行：

```bash
docker compose run --rm dev
```

## New Computer Migration

新电脑迁移流程：

```bash
git clone https://github.com/Jian9ww/imx6ull-lab.git
cd imx6ull-lab
docker compose pull
./scripts/devshell.sh
./scripts/check_toolchain.sh
```

如果新电脑没有 Compose v2，但安装了旧版 `docker-compose`，脚本会自动回退到旧版命令。

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

推荐把构建好的 Docker 镜像 push 到 GHCR。最终目标是新电脑只需要：

1. `git clone`
2. `docker compose pull`
3. `./scripts/devshell.sh`
4. `./scripts/check_toolchain.sh`

即可进入一致的开发环境。
