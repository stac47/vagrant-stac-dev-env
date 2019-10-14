#!/usr/bin/env bash

set -o xtrace
set -o nounset
set -o errexit

STAC_DOT_FILES='.stac-dot-files'
GO_VERSION='1.13.1'
HOME_FOR_VAGRANT='/home/vagrant'

apt-get update && apt-get dist-upgrade -y && apt-get install -y \
    build-essential \
    tree \
    zsh

chsh -s /bin/zsh vagrant

if [[ ! -d "${STAC_DOT_FILES}" ]]; then
    git clone https://github.com/stac47/stac-dot-files.git ${STAC_DOT_FILES}
    pushd ${STAC_DOT_FILES}
    git submodule update --init
    popd
fi

ln -sf ${STAC_DOT_FILES}/.zshrc .zshrc
if [[ ! -e "${HOME_FOR_VAGRANT}/.zshenv" ]]; then
    echo "source ${HOME_FOR_VAGRANT}/${STAC_DOT_FILES}/.zshenv" > "${HOME_FOR_VAGRANT}/.zshenv"
fi
ln -sf ${STAC_DOT_FILES}/.vimrc .vimrc
ln -sf ${STAC_DOT_FILES}/.vim .vim
ln -sf ${STAC_DOT_FILES}/.gitconfig .gitconfig
ln -sf ${STAC_DOT_FILES}/.gitconfig_common .gitconfig_common
ln -sf ${STAC_DOT_FILES}/.gitignore_global .gitignore_global
ln -sf ${STAC_DOT_FILES}/.tmux.conf.linux .tmux.conf

# Rust language
if [[ ! -x $(command -v cargo) ]]; then
    wget https://sh.rustup.rs -O rustup.sh && sh rustup.sh -y && rm rustup.sh
fi

# Go language
if [[ ! -d '/usr/local/go' ]]; then
    wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
    rm go${GO_VERSION}.linux-amd64.tar.gz
    echo "export PATH=/usr/local/go/bin:$PATH" >> ${HOME_FOR_VAGRANT}/.zshenv
fi

chown --recursive vagrant:vagrant ${HOME_FOR_VAGRANT}
