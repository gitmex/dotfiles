#!/bin/bash
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" = "Linux" ];then
    # Do your linux stuff
    source linux.sh
fi

if [ "$machine" = "Mac" ];then
    source mac.sh
fi
