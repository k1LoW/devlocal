#!/bin/bash
export DEVLOCAL=$HOME/.devlocal
export PATH=$DEVLOCAL/bin:$PATH

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/ctags.tar.gz "http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-$CTAGS_VERSION.tar.gz"
tar xzvf ctags.tar.gz
cd ctags-$CTAGS_VERSION
./configure --prefix=$DEVLOCAL
make
make install
