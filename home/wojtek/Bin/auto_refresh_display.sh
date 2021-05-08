#!/bin/sh

#while ps axu | grep startx | grep -vq grep; do
while true; do
	i3-msg -t subscribe '["output"]'
	refresh_display.sh
done
