# 02 Git Workflow

## Repository Scope

Git 保存：

- 源码。
- README。
- 学习笔记。
- 调试日志。
- 脚本。
- Dockerfile。
- `docker-compose.yml`。
- 文档模板。

Git 不保存：

- 工具链压缩包。
- Linux Kernel 源码。
- rootfs。
- 烧录镜像。
- SDK。
- 大 PDF / DOCX / 压缩包。

## Suggested Flow

1. `git pull`
2. 修改代码和文档
3. 编译和验证
4. 记录日志
5. Codex review
6. `git status`
7. `git commit`
