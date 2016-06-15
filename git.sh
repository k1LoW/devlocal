#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://www.kernel.org/pub/software/scm/git/git-2.9.0.tar.gz"
tar xzvf git.tar.gz
cd git-2.9.0
./configure --prefix=$DEVLOCAL
make
make install
