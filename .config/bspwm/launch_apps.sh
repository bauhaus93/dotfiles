#!/bin/sh


sxhkd &
dunst &
nm-applet &
blueman-applet &
flameshot &
bitwarden-desktop &
killall -q udiskie
udiskie --smart-tray -f 'alacritty --working-directory' &
picom -b

if [ -x "$HOME/.config/polybar/launch.sh" ];
then
	"$HOME/.config/polybar/launch.sh"
fi
