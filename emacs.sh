#!/bin/bash
export DEVLOCAL=$HOME/.devlocal
export PATH=$DEVLOCAL/bin:$PATH

sudo yum install ncurses-devel

# emacs
cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/emacs.tar.gz "http://ftp.gnu.org/pub/gnu/emacs/emacs-$EMACS_VERSION.tar.gz"
tar zxvf emacs.tar.gz
cd emacs-$EMACS_VERSION/
./configure --prefix=$DEVLOCAL --without-x
make
make install
