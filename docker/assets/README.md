# Docker Local Assets

该目录只用于本地临时放构建 Docker 镜像所需的大文件。

后续可能临时放入：

- `gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz`

该目录下的大文件不提交 Git。

`.gitignore` 会忽略 `docker/assets/*`，但保留本 `README.md`。
