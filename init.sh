#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://raw.github.com/k1LoW/devlocal/master/"
fi

curl $script_url/centos.sh|bash
