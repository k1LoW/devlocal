#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/global.tar.gz http://tamacom.com/global/global-6.3.2.tar.gz
tar xvf global.tar.gz
cd global-6.3.2
./configure --prefix=$DEVLOCAL
make
make install
