#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://raw.github.com/k1LoW/devlocal/master/"
fi

tmp=`cat /etc/issue | head -n 1`
DIST=`echo $tmp | awk '{print $1}'`

if [[ $DIST =~ "CentOS" ]]; then
    curl $script_url/centos.sh|bash
elif [[ $DIST =~ "Ubuntu" ]]; then
    curl $script_url/ubuntu.sh|bash
fi

DEVLOCAL=$HOME/.devlocal
mkdir -p $DEVLOCAL/source

export PATH="$DEVLOCAL/bin:$PATH"

# git
curl $script_url/git.sh|bash

# ctags
curl $script_url/ctags.sh|bash

# zsh
curl $script_url/zsh.sh|bash

# emacs
curl $script_url/emacs.sh|bash

# anyenv
git clone git@github.com:riywo/anyenv.git ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# homesick
anyenv install rbenv
eval "$(anyenv init -)"
rbenv install 2.1.1 --verbose
rbenv global 2.1.1
rbenv rehash
gem install homesick
rbenv rehash
homesick clone k1LoW/dotfiles
homesick symlink dotfiles --force

# editorconfig
anyenv install ndenv
eval "$(anyenv init -)"
ndenv install v0.11.12 --verbose
ndenv global v0.11.12
ndenv rehash
npm install -g editorconfig
ndenv rehash

echo '$HOME/.devlocal/bin/zsh' >> ~/.bashrc
source ~/.bashrc
