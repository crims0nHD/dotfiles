#!/bin/bash
selected=$(echo -e "AwesomeWM config\nAwesomeWM theme\nRofi theme\nEdit config rofi script\nNvim config" | rofi -dmenu -p "Edit config")
sel_path=""

if [[ "${selected}" == "AwesomeWM config" ]]
then
	sel_path="~/.config/awesome/rc.lua"

elif [[ "${selected}" == "AwesomeWM theme" ]]
then
	sel_path="~/.config/awesome/themes/david/theme.lua"

elif [[ "${selected}" == "Rofi theme" ]]
then
	sel_path="~/.config/rofi/config.rasi"

elif [[ "${selected}" == "Edit config rofi script" ]]
then
	sel_path="~/.config/awesome/scripts/editConfigLauncher.sh"

elif [[ "${selected}" == "Nvim config" ]]
then
	sel_path="~/.config/nvim/init.vim"
fi

if [[ ! -z $sel_path ]]
then
	kitty sh -c "cat ~/.cache/wal/sequences; nvim ${sel_path}" 
fi
