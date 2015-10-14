#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/gcc.tar.gz "http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-5.2.0/gcc-5.2.0.tar.gz"
tar xzvf gcc.tar.gz
cd gcc-5.2.0
./contrib/download_prerequisites
./configure --prefix=$DEVLOCAL
make
make install

