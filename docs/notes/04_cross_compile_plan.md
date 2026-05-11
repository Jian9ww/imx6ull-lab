# 04 Cross Compile Plan

当前决定：

- 教程开发环境使用 Ubuntu 16.04。
- 本仓库 Docker 开发镜像优先使用 `ubuntu:16.04`，以尽量贴近教程。
- 第二阶段目标是把 Linaro 4.9.4 工具链内置到 Docker 镜像。
- Git 不保存工具链压缩包。
- `docker/assets/` 可临时存放工具链压缩包用于本地构建镜像。
- 不提交 `docker/assets/` 下的工具链压缩包。
- Docker 镜像中的工具链路径：
  `/opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf`
- Docker 镜像会配置：
  - `TOOLCHAIN_ROOT`
  - `PATH`
  - `ARCH=arm`
  - `CROSS_COMPILE=arm-linux-gnueabihf-`

## Verification Commands

进入容器后执行：

```bash
./scripts/check_toolchain.sh
```

也可以手动检查：

- `which arm-linux-gnueabihf-gcc`
- `arm-linux-gnueabihf-gcc -v`
- `arm-linux-gnueabihf-gcc -dumpmachine`
- `arm-linux-gnueabihf-gcc -dumpversion`
- `which arm-linux-gnueabihf-ld`
- `which arm-linux-gnueabihf-objcopy`
- `which arm-linux-gnueabihf-objdump`

## Image Migration

本机已构建并验证过的本地镜像原名：

```text
imx6ull-dev:base
```

迁移到 GHCR 使用的镜像名：

```text
ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

推送前打 tag：

```bash
docker tag imx6ull-dev:base ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

登录 GHCR：

```bash
echo "<GITHUB_PAT>" | docker login ghcr.io -u Jian9ww --password-stdin
```

不要把 GitHub token 写入任何文件。

推送镜像：

```bash
docker push ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

新电脑迁移流程：

```bash
git clone https://github.com/Jian9ww/imx6ull-lab.git
cd imx6ull-lab
docker compose pull
./scripts/devshell.sh
./scripts/check_toolchain.sh
```

## Current Boundary

- `chapters/00_environment/01_hello_cross_compile/src/hello.c` 已用于最小交叉编译验证。
- 当前不写裸机代码。
- 当前不写 Linux 驱动代码。
- 后续目标是将镜像 push 到 Docker 镜像仓库，实现多电脑复用。
- Ubuntu 16.04 只用于隔离编译环境，不作为生产运行环境。
