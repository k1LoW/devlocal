#!/bin/bash
DEVLOCAL=$HOME/.devlocal

anyenv install goenv
exec $SHELL -l
goenv install 1.5 --verbose
goenv global 1.5
goenv rehash

go get github.com/peco/peco/cmd/peco
