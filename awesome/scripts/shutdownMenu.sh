#!/bin/bash

selected=$(echo -e "Shutdown\nRestart\nChill" | rofi -dmenu -p "[?]: ")

if [[ $selected == "Shutdown" ]]
then
	shutdown -h 0

elif [[ $selected == "Restart" ]]
then
	reboot 0

elif [[ $selected == "Chill" ]]
then
	sh -c "doas pm-suspend"
	echo "heyho"
fi
