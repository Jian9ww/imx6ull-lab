# 01 Hello Cross Compile

## Goal

验证 Docker 镜像内置的 Linaro 4.9.4 交叉编译工具链可以生成 i.MX6ULL 可用的 ARM 32-bit ELF 程序。

## Status

implemented

## Source

- `src/hello.c`

## Output

- `hello_imx6ull`

## Build

在仓库根目录执行：

```bash
./scripts/build.sh chapters/00_environment/01_hello_cross_compile
```

或进入 Docker 容器后执行：

```bash
cd /work/chapters/00_environment/01_hello_cross_compile
make
```

## Check

进入 Docker 容器后执行：

```bash
cd /work/chapters/00_environment/01_hello_cross_compile
make check
```

`check` target 使用 `file hello_imx6ull` 检查输出是否为 ARM 32-bit ELF。

## Clean

在宿主机执行：

```bash
./scripts/clean.sh chapters/00_environment/01_hello_cross_compile
```

或进入 Docker 容器后执行：

```bash
cd /work/chapters/00_environment/01_hello_cross_compile
make clean
```

## Deploy

当前阶段不部署到开发板。

## Notes

- 本实验依赖 Docker 镜像内置的 `arm-linux-gnueabihf-gcc`。
- 不假设宿主机安装了交叉编译工具链。
