#!/bin/sh

color=$(awk '{if($1 != "")print $1}' /home/wojtek/.local/color_palette | custom_dmenu -l 21)
awk -v color=$color '{if($1 == color) printf "%s", $2}' /home/wojtek/.local/color_palette | xclip -i -selection clipboard
