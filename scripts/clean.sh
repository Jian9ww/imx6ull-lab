#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chapter_experiment_dir>" >&2
    exit 1
fi

experiment_dir="$1"
makefile="${experiment_dir}/Makefile"

if [ ! -f "${makefile}" ]; then
    echo "No Makefile found in ${experiment_dir}" >&2
    exit 1
fi

make -C "${experiment_dir}" clean
