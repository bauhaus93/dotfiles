#!/bin/sh

DIR=`dirname $(readlink -f $0)`

stow -v --no-folding -t "$HOME" -d "$DIR" .
