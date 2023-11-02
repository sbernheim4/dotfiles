#!/bin/bash

function display () {
	xstatus=$(spotify status | head -n 1)

	if echo "$xstatus" | grep -q "playing"; then
		local name=$(getName)
		echo "$name"
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
