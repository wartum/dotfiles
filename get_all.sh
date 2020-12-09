#!/bin/bash
while read line; do
	FULLPATH=$(realpath "${line%/*}/")
	mkdir -p ".${FULLPATH}"
	cp -r "$line" ".${FULLPATH}"
done < ./list
git status
