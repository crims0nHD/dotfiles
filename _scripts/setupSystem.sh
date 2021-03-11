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
	pacman -S base-devel awesome rofi kitty fish neovim picom emacs fd ripgrep git wget
	imagemagick numlockx

	#install AUR helper
	mkdir -p /tmp/dotfiles/setup/paru
	git clone https://aur.archlinux.org/paru.git /tmp/dotfiles/setup/paru
	cd /tmp/dotfiles/setup/paru
	#makepkg -si

# Debian based distros
elif [ ! -z $(command -v apt) ]
then
	apt update
	apt upgrade
	apt install awesome rofi kitty fish neovim emacs fd-find ripgrep
	apt install picom
fi

