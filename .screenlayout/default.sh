#!/bin/sh
xrandr \
	--output HDMI-0 \
		--primary \
		--mode 5120x1440 \
		--rate 240 \
		--pos 0x0 \
		--rotate normal \
	--output DP-0 --off \
	--output DP-1 --off \
	--output DP-2 --off \
	--output DP-3 --off \
	--output DP-4 --off \
	--output DP-5 --off
