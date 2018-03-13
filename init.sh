#!/bin/bash
set -u
if [ -z ${script_url:-} ];then
    export script_url="https://raw.githubusercontent.com/k1LoW/devlocal/master"
fi

sudo yum -y install gcc make openssl-devel zlib-devel ncurses-devel perl-devel gettext-devel curl-devel expat-devel texinfo readline-devel

DEVLOCAL=$HOME/.devlocal
mkdir -p $DEVLOCAL/source

export PATH="$DEVLOCAL/bin:$PATH"

# git
export GIT_VERSION="2.16.2"
curl $script_url/git.sh|bash

# zsh
export ZSH_VERSION="5.4.2"
curl $script_url/zsh.sh|bash

# emacs
export EMACS_VERSION="25.3"
curl $script_url/emacs.sh|bash

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

echo '$HOME/.devlocal/bin/zsh' >> ~/.bashrc
source ~/.bashrc
