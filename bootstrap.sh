#!/usr/bin/env bash

set -o xtrace
set -o nounset
set -o errexit

STAC_DOT_FILES='.stac-dot-files'

apt-get update && apt-get install -y \
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
ln -sf ${STAC_DOT_FILES}/.zshenv .zshenv
ln -sf ${STAC_DOT_FILES}/.vimrc .vimrc
ln -sf ${STAC_DOT_FILES}/.vim .vim
ln -sf ${STAC_DOT_FILES}/.gitconfig .gitconfig
ln -sf ${STAC_DOT_FILES}/.gitconfig_common .gitconfig_common
ln -sf ${STAC_DOT_FILES}/.gitignore_global .gitignore_global
ln -sf ${STAC_DOT_FILES}/.tmux.conf.linux .tmux.conf

wget https://sh.rustup.rs -O rustup.sh && sh rustup.sh -y && rm rustup.sh
