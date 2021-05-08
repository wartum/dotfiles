#!/bin/sh

[ -z "$2" ] && bgpath=$(find ~/Pictures/wallpapers/ -type f | sort | sxiv -i -o -t) || bgpath="$2"
[ -z "$bgpath" ] && exit 1
[ -z "$1" ] && bgtype=$(echo "tile\ncenter\nmaximize\nzoom" | custom_dmenu)  || bgtype="$1"
[ -z "$bgtype" ] && exit 1

echo "xwallpaper --${bgtype} $(realpath ${bgpath})" > ~/.local/bin/setxwall
chmod 755 ~/.local/bin/setxwall
/bin/sh ~/.local/bin/setxwall
