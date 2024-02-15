#!/bin/sh


sxhkd &
dunst &
nm-applet &
flameshot &
killall -q udiskie
udiskie --smart-tray -f 'alacritty --working-directory' &
picom -b

if [ -x "$HOME/.config/polybar/launch.sh" ];
then
	"$HOME/.config/polybar/launch.sh"
fi
