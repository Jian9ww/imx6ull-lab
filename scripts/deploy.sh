#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <local_file> [remote_name]" >&2
    exit 1
fi

env_file="scripts/board.env"

if [ ! -f "${env_file}" ]; then
    echo "${env_file} not found. Copy scripts/board.env.example to ${env_file} and edit it first." >&2
    exit 1
fi

# shellcheck disable=SC1090
. "${env_file}"

: "${BOARD_IP:?BOARD_IP is required in scripts/board.env}"
: "${BOARD_USER:?BOARD_USER is required in scripts/board.env}"
: "${BOARD_DIR:?BOARD_DIR is required in scripts/board.env}"

local_file="$1"

if [ ! -f "${local_file}" ]; then
    echo "Local file not found: ${local_file}" >&2
    exit 1
fi

remote_name="${2:-$(basename "${local_file}")}"

scp "${local_file}" "${BOARD_USER}@${BOARD_IP}:${BOARD_DIR}/${remote_name}"
