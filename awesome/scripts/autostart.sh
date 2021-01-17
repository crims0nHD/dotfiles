#!/bin/bash
if [ ! -z $(pgrep picom) ]
then
	picom &
fi

setxkbmap de -option caps:swapescape &
numlockx on &
