#!/usr/bin/env bash
set -euo pipefail

if docker compose version >/dev/null 2>&1; then
    compose_cmd=(docker compose)
elif docker-compose --version >/dev/null 2>&1; then
    compose_cmd=(docker-compose)
else
    echo "Docker Compose is not available." >&2
    echo "Install Docker Compose v2 ('docker compose') or legacy docker-compose." >&2
    exit 1
fi

"${compose_cmd[@]}" run --rm dev
