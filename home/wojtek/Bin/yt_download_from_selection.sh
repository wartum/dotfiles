#!/bin/sh
SELECTION="$(xclip -o -selection clipboard)"
[ -z "$SELECTION" ] && exit 1

FORMAT=$(echo "Audio\nVideo & Audio" | custom_dmenu -p "Select download format")
[ -z "$FORMAT" ] && exit 1

if [ "$FORMAT" = 'Audio' ]; then
  AUDIO_VIDEO="-f bestaudio"
  DIR="${HOME}/Music/$(ls ~/Music | custom_dmenu -p "Select directory")"
else
  DIR="${HOME}/Video/$(ls ~/Video | custom_dmenu -p "Select directory")"
fi
[ -z "$DIR" ] && exit 1

mkdir -p "$DIR" && cd "$DIR" \
&& notify-send "downloading $SELECTION" \
&& youtube-dl $SELECTION ${AUDIO_VIDEO} -o "%(title)s.%(ext)s" -i
if [ $? = 0 ]; then
  notify-send "\"$(youtube-dl -e $SELECTION)\" downloaded succesfully"
else
  notify-send "Error occured while downloading file"
fi
