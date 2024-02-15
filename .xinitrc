#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap de

export SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass

keychain ~/.ssh/id_rsa
if [ -f ~/.keychain/$HOSTNAME-sh ];
then
	~/.keychain/$HOSTNAME-sh 2>/dev/null
fi

if [ -f ~/.keychain/$HOSTNAME-sh-gpg ];
then
	~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null
fi


exec bspwm
