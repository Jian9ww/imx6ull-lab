#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chapter_dir_name>" >&2
    echo "Example: $0 ch40_chrdev_basic" >&2
    exit 1
fi

chapter_name="$1"
chapter_dir="chapters/${chapter_name}"
template="docs/templates/chapter-readme-template.md"

mkdir -p "${chapter_dir}/src" "${chapter_dir}/logs"

if [ ! -f "${chapter_dir}/README.md" ]; then
    if [ -f "${template}" ]; then
        cp "${template}" "${chapter_dir}/README.md"
    else
        printf '# %s\n\n## TODO\n\n' "${chapter_name}" > "${chapter_dir}/README.md"
    fi
fi

if [ ! -f "${chapter_dir}/notes.md" ]; then
    printf '# Notes\n\n## TODO\n\n' > "${chapter_dir}/notes.md"
fi

if [ ! -f "${chapter_dir}/Makefile" ]; then
    printf '.PHONY: all clean\n\nall:\n\t@echo "TODO: add build rules for %s"\n\nclean:\n\t@echo "TODO: add clean rules for %s"\n' "${chapter_name}" "${chapter_name}" > "${chapter_dir}/Makefile"
fi

touch "${chapter_dir}/src/.gitkeep" "${chapter_dir}/logs/.gitkeep"

echo "Created or updated ${chapter_dir}"
