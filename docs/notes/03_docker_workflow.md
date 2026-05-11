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

Linaro 4.9.4 交叉编译工具链内置到 Docker 镜像后，把镜像 push 到 GHCR，便于多台电脑复用。

## Image Name

`docker-compose.yml` 使用的镜像名：

```text
ghcr.io/jian9ww/imx6ull-dev:linaro-4.9.4
```

本机已构建并验证过的本地镜像原名：

```text
imx6ull-dev:base
```

## Push To GHCR

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

不要提交 `docker/assets/` 下的工具链压缩包。

## New Computer Flow

```bash
git clone https://github.com/Jian9ww/imx6ull-lab.git
cd imx6ull-lab
docker compose pull
./scripts/devshell.sh
./scripts/check_toolchain.sh
```
