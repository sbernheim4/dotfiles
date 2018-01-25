#!/usr/bin/env osascript
# Returns the current playing song in Spotify for OSX

tell application "Spotify"
  if it is running then
    if player state is playing then
      set track_name to name of current track
      set artist_name to artist of current track

      if artist_name > 0
        # If the track has an artist set and is therefore most likely a song rather than an advert
        "♫ " & artist_name & " - " & track_name
      else
        # If the track doesn't have an artist set and is therefore most likely an advert rather than a song
        "~ " & track_name
      end if
    end if
  end if
end tell
