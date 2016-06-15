#!/bin/bash
set -u
if [ -z ${script_url:-} ];then
    export script_url="https://raw.githubusercontent.com/k1LoW/devlocal/master"
fi

curl $script_url/centos.sh|bash

DEVLOCAL=$HOME/.devlocal
mkdir -p $DEVLOCAL/source

export PATH="$DEVLOCAL/bin:$PATH"

# git
curl $script_url/git.sh|bash

# zsh
curl $script_url/zsh.sh|bash

# emacs
curl $script_url/emacs.sh|bash

# ctags
curl $script_url/ctags.sh|bash

# GNU GLOBAL
curl $script_url/gtags.sh|bash

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# homesick
anyenv install rbenv
eval "$(anyenv init -)"
rbenv install 2.2.5 --verbose
rbenv global 2.2.5
rbenv rehash
gem install homesick
rbenv rehash
homesick clone k1LoW/dotfiles
homesick symlink dotfiles --force

# editorconfig
anyenv install ndenv
eval "$(anyenv init -)"
ndenv install v4.4.5 --verbose
ndenv global v4.4.5
ndenv rehash
npm install -g editorconfig
ndenv rehash

sudo yum install patch -y

# pygments
anyenv install pyenv
eval "$(anyenv init -)"
pyenv install 2.7.8 --verbose
pyenv global 2.7.8
pyenv rehash
pip install pygments
pyenv rehash

# peco
curl $script_url/peco.sh|bash

# composer
curl $script_url/composer.sh|bash

echo '$HOME/.devlocal/bin/zsh' >> ~/.bashrc
source ~/.bashrc
