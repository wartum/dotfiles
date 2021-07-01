#!/bin/sh

while true; do
  packages=$(pacman -Qdt | awk '{print $1}')
  [ -z "$packages" ] && exit 0
  paru -Rsc $packages
done
