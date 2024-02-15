#!/bin/sh

DIR=`dirname $(readlink -f $0)`

stow -v -t "$HOME" -d "$DIR" .
