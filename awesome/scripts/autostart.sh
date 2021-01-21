#!/bin/bash
setxkbmap de -option caps:swapescape &
numlockx on &

if [ ! -z "$(which emacs)" ]
then
    emacs --daemon &
fi

if [ -f "$HOME/.config/screensetting.sh" ];
then
	source $HOME/.config/screensetting.sh
fi
