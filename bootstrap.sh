#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

apt-get update && apt-get dist-upgrade -y && apt-get install -y \
    apt-transport-https \
    build-essential \
    elfutils \
    gdb \
    pkg-config \
    silversearcher-ag \
    tree \
    zsh

chsh -s /bin/zsh vagrant
