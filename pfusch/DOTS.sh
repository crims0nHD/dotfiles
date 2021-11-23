#!/bin/sh
# This is the reference DOTS file for the davdot script

# Distro will be exposed using the $DISTRO variable
# possible values: arch-linux, debian, gentoo, manjaro, alpine

# DEPS is the variable that holds the dependencies needed for your dotfiles
# BUILDDEPS is the variable that holds any dependencies not needed after building the dots
# NOTE: since dependencies tend to differ among distros and i don't want to deal with it i made it so you have to do it yourself... too bad

if [ $DISTRO = "arch-linux" ]; then
   DEPS=(git curl neovim emacs fd ripgrep flatpak)
   BUILDDEPS=(cmake)
fi

# FLATPKGS: packages to be installed via flatpak
# FLATREPOS: repositories for flatpak
# NOTE: if the flatpak binary cant be found these will not be set. please make sure to include those in your dependencies
FLATPKGS=()
FLATREPOS=()

# TODO: maybe tarball dotfiles
SOURCE=("git clone https://github.com/crims0nHD/dotfiles -b devel ./dotfiles")

# entry: (path-to-source(s) destination arguments)
# arguments: undotted: file(s) need the prefix . when linking
LINKS=($("./dotfiles/home/*" "$HOME" $("undotted"))\
   $("./dotfiles/config/*" "$HOME/.config" $("undotted")))
