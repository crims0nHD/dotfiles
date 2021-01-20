#!/bin/bash

selected=$(echo -e "Shutdown\nRestart\nChill" | rofi -dmenu -p "[?]: ")

if [[ $selected == "Shutdown" ]]
then
	sudo shutdown -h 0

elif [[ $selected == "Restart" ]]
then
	sudo reboot 0

elif [[ $selected == "Chill" ]]
then
	pm-is-supported --suspend && sudo pm-suspend

fi
