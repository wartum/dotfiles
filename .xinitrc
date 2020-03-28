source ~/.bashrc
[ -f ~/.Xresources ] && xrdb ~/.Xresources
~/Bin/refresh_display.sh
xbindkeys
exec i3
