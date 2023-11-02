#!/bin/bash

function display () {
	spotify_status=$(spotify status | head -n 1)

	if [[ $spotify_status == *"playing"* ]]; then
		echo $(getName)
	else
		echo ""
	fi
}

function getArtistName () {
	spotify status artist
}

function getTrackName () {
	spotify status track
}

function getName() {
    local artist=$(getArtistName)
    local song=$(getTrackName)
    echo "${artist} - ${song}"
}

display
