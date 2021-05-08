#!/bin/sh

killall polybar
for m in $(xrandr | awk '/\sconnected/ {print $1}'); do
  MONITOR=${m} /usr/bin/polybar $1 custom&
done
