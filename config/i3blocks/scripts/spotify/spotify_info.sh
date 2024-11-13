#!/bin/bash

print_song_info() {
	#title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep title -C 1 | grep variant | cut -d '"' -f 2)
	#artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep xesam:albumArtist -C 2 | grep string |tail -1 | cut -d '"' -f 2)
	echo -e "\uf1bc $1 - $2"
	echo ""
	#echo "#1DB954"
	echo "#00FF00"
}

get_and_print_song_info() {
	title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep title -C 1 | grep variant | cut -d '"' -f 2)
	artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep xesam:albumArtist -C 2 | grep string |tail -1 | cut -d '"' -f 2)
	echo -e "\uf1bc $artist - $title"
	echo ""
	#echo "#1DB954"
	echo "#00FF00"

}

#dbus-monitor destination=org.mpris.MediaPlayer2.spotify path=/org/mpris/MediaPlayer2 interface=org.freedesktop.DBus.Properties member=PropertiesChanged | while read line;do
#	if [[ $line ==  *"PlaybackStatus"* ]]; then
#		echo $line
#	fi
#done &

i=0
title=""
artist=""

inside_metadata=false
found_title=false
found_artist=false
already_echoed=false
playback_status_changed=false

dbus-monitor destination=org.mpris.MediaPlayer2.spotify member=PropertiesChanged type=signal path=/org/mpris/MediaPlayer2 interface=org.freedesktop.DBus.Properties | while read line; do
	if [[ $line == *"Metadata"* ]]; then
		inside_metadata=true
	fi


	if [[ $inside_metadata == true ]]; then
		if [[ $found_title == true ]]; then
			title=$(echo "$line" | cut -d '"' -f 2)
			found_title=done
		elif [[ $found_artist == true ]]; then
			artist=$(echo "$line" | cut -d '"' -f 2)
			found_artist=done
		fi

		if [[ $found_artist == done ]] && [[ $found_title == done ]];then
			inside_metadata=false
			found_title=false
			found_artist=false
			print_song_info "$artist" "$title"
			exit
		fi

		if [[ $line == *"xesam:title"* ]]; then
			found_title=true
		elif [[ $line = *"xesam:artist"* ]]; then
			found_artist=1
		elif [[ $found_artist == 1 ]]; then
			found_artist=true
		fi
	fi
	
	if [[ $playback_status_changed == true ]];then
		status=$(echo "$line" | cut -d '"' -f 2)
		playback_status_changed=false

		if [[ $status == "Paused" ]];then
			echo ""
			exit
		elif [[ $status == "Playing" ]]; then
			get_and_print_song_info
			exit
		fi
	fi

	if [[ $line == *'string "PlaybackStatus"'* ]];then
		playback_status_changed=true
	fi
done
