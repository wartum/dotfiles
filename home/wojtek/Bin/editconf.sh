#!/bin/sh

HOME=/home/wojtek
CFGS="${HOME}/.vim/vimrc                           vimrc"
CFGS="${CFGS}\n${HOME}/.bashrc                     bashrc"
CFGS="${CFGS}\n${HOME}/.config/i3/config           i3_config"
CFGS="${CFGS}\n${HOME}/.config/newsboat/config     newsboat_config"
CFGS="${CFGS}\n${HOME}/.config/newsboat/urls       newsboat_urls"
CFGS="${CFGS}\n${HOME}/.config/ranger/rc.conf      ranger_config"
CFGS="${CFGS}\n${HOME}/.config/ranger/rifle.conf   ranger_opener"
CFGS="${CFGS}\n${HOME}/.config/ranger/scope.sh     ranger_previewer"
CFGS="${CFGS}\n${HOME}/.config/i3blocks/config     i3blocks_config"

CFG_NAME=$(echo ${CFGS} | awk  '{print $2}' | custom_dmenu -l 15)
vim $(echo $CFGS | grep $CFG_NAME | awk '{print $1}')
