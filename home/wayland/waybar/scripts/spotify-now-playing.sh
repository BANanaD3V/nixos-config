#!/usr/bin/env sh
while true
do
	player_status=$(playerctl status -p spotify 2> /dev/null)
	if [ "$player_status" = "Playing" ]; then
    		echo "$(playerctl metadata artist -p spotify) - $(playerctl metadata title -p spotify)"
	else
    		echo "Nothing is playing"
	fi
done
