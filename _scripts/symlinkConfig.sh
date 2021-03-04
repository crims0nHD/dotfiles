#!/bin/bash

if [[ ! -d "~/.cache" ]]
then
    mkdir ~/.cache
fi

ln -s $PWD/awesome ~/.config/awesome
ln -s $PWD/fish ~/.config/fish
ln -s $PWD/kitty ~/.config/kitty
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/picom ~/.config/picom
ln -s $PWD/rofi ~/.config/rofi
ln -s $PWD/doom.d ~/.doom.d
ln -s $PWD/cache_wal/ ~/.cache/wal
