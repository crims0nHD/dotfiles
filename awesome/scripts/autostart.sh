#!/bin/bash
setxkbmap de -option caps:swapescape &
numlockx on &

if [ -f "$HOME/.config/screensetting.sh" ];
then
	source $HOME/.config/screensetting.sh
fi
