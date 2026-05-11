#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chapter_experiment_dir>" >&2
    echo "Example: $0 chapters/00_environment/01_hello_cross_compile" >&2
    exit 1
fi

experiment_dir="$1"

if docker compose version >/dev/null 2>&1; then
    compose_cmd=(docker compose)
elif docker-compose --version >/dev/null 2>&1; then
    compose_cmd=(docker-compose)
else
    echo "Docker Compose is not available." >&2
    echo "Install Docker Compose v2 ('docker compose') or legacy docker-compose." >&2
    exit 1
fi

"${compose_cmd[@]}" run --rm dev sh -lc "cd /work/${experiment_dir} && make"
