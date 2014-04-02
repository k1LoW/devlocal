#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/ctags.tar.gz "http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-5.8j2.tar.gz"
tar xzvf ctags.tar.gz
cd ctags-5.8j2.tar.gz
./configure --prefix=$DEVLOCAL
make
make install
