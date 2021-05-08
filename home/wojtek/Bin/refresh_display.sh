#!/bin/sh -x

if [ $(xrandr | grep -c ' connected') = 1 ]
then
  xrandr --auto
else
	for OUTPUT in $(xrandr | awk '/\sconnected/ {print $1}'); do
	  case "$OUTPUT" in
		eDP1)
		  xrandr --output "$OUTPUT" --auto --primary
		;;
		DP2-3)
		  xrandr --output "$OUTPUT" --auto --above eDP1
		;;
		*)
		  xrandr --output "$OUTPUT" --auto --right-of eDP1
		;;
	  esac
	done
fi

~/.local/bin/setxwall
