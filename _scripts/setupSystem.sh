#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Arch based distros
if [ ! -z $(command -v pacman) ]
then
	pacman -Syu
	pacman -S awesome rofi kitty fish neovim picom emacs fd ripgrep git wget

# Debian based distros
elif [ ! -z $(command -v apt) ]
then
	apt update
	apt upgrade
	apt install awesome rofi kitty fish neovim emacs fd-find ripgrep
	apt install picom
fi

