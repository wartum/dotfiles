#!/bin/bash

find -L ~/Music \( -iname *.webm -o -iname *.m4a -o -iname *.mp3 -o -iname *.mp4 -o -iname *.mkv \) -exec bash -c \
	'
	ext="${1##*.}"
	original_name="$1"
	new_name="${1%*${ext}}ogg"
	ffmpeg -i "${original_name}" -vn -y "${new_name}"
	rm "${original_name}"
	' \
	_ {} \;
