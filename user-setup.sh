#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

STAC_DOT_FILES='.stac-dot-files'

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
