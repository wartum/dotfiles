#!/bin/sh

for feed in ~/Documents/rss_feeds/*.txt; do
	[ -e "$feed" ] || continue
	feed_title=$(grep "^Feed: " "$feed")
	feed_title=${feed_title#*: }

	episode_title=$(grep "^Title: " "$feed")
	episode_title=$(echo "${episode_title#*: }" | tr '/' '\' 2> /dev/null)

	date=$(awk '/Date: / {switch ($4) {
			case "Jan": $4="01"; break
			case "Feb": $4="02"; break
			case "Mar": $4="03"; break
			case "Apr": $4="04"; break
			case "May": $4="05"; break
			case "Jun": $4="06"; break
			case "Jul": $4="07"; break
			case "Aug": $4="08"; break
			case "Sep": $4="09"; break
			case "Oct": $4="10"; break
			case "Nov": $4="11"; break
			case "Dec": $4="12"; break
		}
		print $5"-"$4"-"$3}' "$feed")

	download_url=$(grep "^Podcast Download URL: " "$feed")
	[ -z "$download_url" ] && download_url=$(grep "^Link: " "$feed")
	download_url=${download_url#*: }
	download_url=${download_url%* (type*}

	if grep -Pq "Link: .*www\.youtube\.com" "$feed"; then
		download_url=$(grep "^Link: " "$feed")
		download_url=${download_url#*: }
		dest_dir=~/Podcasts/$(echo "$feed_title" | tr ' ' '_') \
		&& mkdir -p "$dest_dir" \
		&& cd "$dest_dir" \
		&& youtube-dl "$download_url" -f bestaudio	-o "$date:%(title)s.%(ext)s" -i \
		&& rm "$feed"
	else
		ext="$(awk '
		/\(type: audio\/ogg\)/ {print "ogg"}
		/\(type: audio\/mpeg\)/ {print "mp3"}
		' "$feed")"
		dest_dir=~/Podcasts/$(echo "$feed_title" | tr ' ' '_') \
		&& mkdir -p "$dest_dir" \
		&& cd "$dest_dir" \
		&& echo "downloading ${date}:${episode_title}.${ext}" \
		&& wget -q -O - "$download_url" > "${date}:${episode_title}".${ext} \
		&& rm "$feed" \
		|| rm "${date}:${episode_title}".${ext}
	fi
done
