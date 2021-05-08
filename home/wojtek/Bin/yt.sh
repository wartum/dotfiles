#!/bin/bash -x

defcmd="fzf"
guicmd="custom_dmenu -i -l 15"

while true; do
	ids=""
	channelName="$(awk '{$NF=""; print}' "$HOME/.local/yt_channels" | $guicmd)"
	channelUrl="$(grep "$channelName" "$HOME/.local/yt_channels" | awk '{print $NF}')"
	response="$(curl -s "${channelUrl}/videos" | sed 's|\\.||g')"

	if  grep -q "script" <<< "$response"; then
		echo "unable to fetch yt";
		exit 1;
	fi

	vgrep='"gridVideoRenderer":{"videoId":"\K.{11}".+?"text":".+?[^\\](?=")'
	getresults() {
		grep -oP "$1" <<< "$response" |\
		awk -F\" -v p="$2" '{ print $1 "\t" p " " $NF}'
	}

	videoids=$(getresults "$vgrep")
	[ -n "$videoids" ] && ids="$ids$videoids"
	videolink="https://youtu.be/"

	clear
	choice=$(echo -e "$ids" | cut -d'	' -f2 | $defcmd) # dont show id
	if [ -n "$choice" ]; then
		id=$(echo -e "$ids" | grep -Fwm1 "$choice" | cut -d'	' -f1) # get id of choice
		echo -e "$choice\t($id)"
		case $id in
			# 11 digit id = video
			???????????) devour mpv "$videolink$id";;
		esac
	fi
	clear
done
