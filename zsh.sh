#!/bin/bash
DEVLOCAL=$HOME/.devlocal

cd $DEVLOCAL/source
curl -L -o $DEVLOCAL/source/zsh.tar.gz "http://downloads.sourceforge.net/project/zsh/zsh/5.0.5/zsh-5.0.5.tar.gz?r=&ts=1394454707&use_mirror=jaist"
tar xzvf zsh.tar.gz
cd zsh-5.0.5
./configure --prefix=$DEVLOCAL --enable-multibyte --enable-locale
make
make install
