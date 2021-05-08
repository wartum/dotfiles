#!/bin/sh

while true; do
  packages=$(pacman -Qdt | awk '{print $1}')
  [ -z "$packages" ] && exit 0
  yay -Rsc $packages
done
