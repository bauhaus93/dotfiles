#!/bin/sh
xrandr \
	--output DP-4 \
		--primary \
		--mode 3440x1440 \
		--rate 100 \
		--pos 0x0 \
		--rotate normal \
	--output DP-0 --off \
	--output DP-1 --off \
	--output DP-2 --off \
	--output DP-3 --off \
	--output DP-5 --off \
	--output HDMI-0 --off
