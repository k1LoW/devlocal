#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://git-core.googlecode.com/files/git-1.9.0.tar.gz"
tar xzvf git.tar.gz
cd git-1.9.0
./configure --prefix=$DEVLOCAL
make
make install
