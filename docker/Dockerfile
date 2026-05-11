FROM ubuntu:16.04

# Ubuntu 16.04 is used because the tutorial development environment is based on
# Ubuntu 16.04. The goal is to keep this isolated Docker environment close to
# the tutorial while keeping the host system clean.
#
# If apt update fails because Ubuntu 16.04 repositories have moved, do not
# guess a mirror here. Handle old-releases source configuration in a separate
# step.

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    make \
    cmake \
    gcc \
    g++ \
    bc \
    bison \
    flex \
    libssl-dev \
    libncurses5-dev \
    cpio \
    rsync \
    openssh-client \
    file \
    tree \
    vim \
    python \
    python3 \
    curl \
    wget \
    xz-utils \
    ca-certificates \
    gdb \
    device-tree-compiler \
    u-boot-tools \
    && rm -rf /var/lib/apt/lists/*

# Do not install Ubuntu apt packages such as:
# - gcc-arm-linux-gnueabihf
# - g++-arm-linux-gnueabihf
# - binutils-arm-linux-gnueabihf
#
# This avoids accidentally mixing system cross compilers with the tutorial's
# Linaro 4.9.4 toolchain.
#
# Do not COPY tutorial documents, kernel source, rootfs, images, or SDK
# archives into this image.
#
# Phase 2 installs the tutorial's Linaro 4.9.4 cross toolchain from the local
# archive placed under docker/assets/. The archive is intentionally ignored by
# Git and must be provided manually before building the image.

COPY docker/assets/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz /tmp/gcc-linaro-4.9.4.tar.xz

RUN mkdir -p /opt/toolchains \
    && tar -xJf /tmp/gcc-linaro-4.9.4.tar.xz -C /opt/toolchains \
    && test -d /opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf \
    && rm -f /tmp/gcc-linaro-4.9.4.tar.xz

ENV TOOLCHAIN_ROOT=/opt/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf
ENV ARCH=arm
ENV CROSS_COMPILE=arm-linux-gnueabihf-
ENV PATH=${TOOLCHAIN_ROOT}/bin:${PATH}

WORKDIR /work

RUN which arm-linux-gnueabihf-gcc \
    && arm-linux-gnueabihf-gcc -dumpmachine \
    && arm-linux-gnueabihf-gcc -dumpversion
