#!/bin/bash

mkdir -p  ~/.vim/bundle 2>&1 > /dev/null
pushd ~/.vim/bundle 2>&1 > /dev/null

git clone https://github.com/cespare/vim-toml.git
git clone https://github.com/tpope/vim-capslock
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/shumphrey/fugitive-gitlab.vim
git clone https://github.com/tpope/vim-git
git clone https://github.com/tpope/vim-markdown
git clone https://github.com/tpope/vim-tbone
git clone https://github.com/tpope/vim-vividchalk

popd 2>&1 > /dev/null
