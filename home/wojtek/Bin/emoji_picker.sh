#!/bin/sh
awk -F';' '{print $1}' ~/.local/emoji | custom_dmenu -l 10 -fn "JetBrains Mono-30" | awk {'printf "%s", $1'} | xclip -i -selection clipboard
