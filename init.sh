#!/bin/bash
set -eu
if [ -z ${script_url:-} ];then
    export script_url="https://raw.githubusercontent.com/k1LoW/devlocal/master"
fi

function exists() {
    which $1 &> /dev/null
}

if exists yum; then
    sudo yum -y install gcc make openssl-devel zlib-devel ncurses-devel perl-devel gettext-devel curl-devel expat-devel texinfo readline-devel
fi

if exists apt-get; then
    sudo apt-get -y install build-essential checkinstall libxpm-dev libjpeg-dev libgif-dev libtiff5-dev tcl-dev gettext libcurl4-gnutls-dev ncurses-dev
fi

export DEVLOCAL=$HOME/.devlocal
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

# ctags
export CTAGS_VERSION="5.8j2"
curl $script_url/ctags.sh|bash

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

anyenv install rbenv
anyenv install goenv

echo 'if [ -f $HOME/.zshrc ];then $HOME/.devlocal/bin/zsh; fi' >> ~/.bashrc

eval "(exec $SHELL -l)"
