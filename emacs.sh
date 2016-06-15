#!/bin/bash
DEVLOCAL=$HOME/.devlocal

export PATH="$DEVLOCAL/bin:$PATH"

sudo yum install ncurses-devel

# emacs
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/emacs.tar.gz "http://ftp.gnu.org/pub/gnu/emacs/emacs-24.5.tar.gz"
zxvf emacs-24.5.tar.gz
cd emacs-24.5/
./configure --prefix=$DEVLOCAL --without-x
make
make install
