#!/usr/bin/env bash
set -euo pipefail

expected_root="/opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf"

echo "TOOLCHAIN_ROOT=${TOOLCHAIN_ROOT:-<unset>}"
echo "PATH=${PATH}"

require_tool() {
    local tool="$1"

    echo
    echo "== which ${tool} =="
    if ! which "${tool}"; then
        echo "ERROR: ${tool} is not available in PATH." >&2
        echo "Expected the Linaro 4.9.4 toolchain under: ${expected_root}" >&2
        echo "Build the Docker image with the toolchain archive in docker/assets/, then run this script inside the container." >&2
        exit 1
    fi
}

require_tool arm-linux-gnueabihf-gcc

echo
echo "== arm-linux-gnueabihf-gcc -v =="
arm-linux-gnueabihf-gcc -v

echo
echo "== arm-linux-gnueabihf-gcc -dumpmachine =="
arm-linux-gnueabihf-gcc -dumpmachine

echo
echo "== arm-linux-gnueabihf-gcc -dumpversion =="
arm-linux-gnueabihf-gcc -dumpversion

require_tool arm-linux-gnueabihf-ld
require_tool arm-linux-gnueabihf-objcopy
require_tool arm-linux-gnueabihf-objdump

echo
echo "Linaro 4.9.4 toolchain is available."
