# 04 Cross Compile Plan

当前决定：

- 教程开发环境使用 Ubuntu 16.04。
- 本仓库 Docker 开发镜像优先使用 `ubuntu:16.04`，以尽量贴近教程。
- 第二阶段目标是把 Linaro 4.9.4 工具链内置到 Docker 镜像。
- Git 不保存工具链压缩包。
- `docker/assets/` 可临时存放工具链压缩包用于本地构建镜像。
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

## Current Boundary

- 当前还没有开始写 `hello.c`。
- 当前不写裸机代码。
- 当前不写 Linux 驱动代码。
- 后续目标是将镜像 push 到 Docker 镜像仓库，实现多电脑复用。
- Ubuntu 16.04 只用于隔离编译环境，不作为生产运行环境。
