#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://git-core.googlecode.com/files/git-2.6.1.tar.gz"
tar xzvf git.tar.gz
cd git-2.6.1
./configure --prefix=$DEVLOCAL
make
make install
