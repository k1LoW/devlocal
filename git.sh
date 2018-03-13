#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/git.tar.gz "https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz"
tar xzvf git.tar.gz
cd git-$GIT_VERSION
./configure --prefix=$DEVLOCAL
make
make install
