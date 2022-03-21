#!/bin/sh
cd ~/.oh-my-zsh/themes

# Get the theme from the official github
curl -L https://github.com/dracula/zsh/archive/master.zip --output dracula.zip

unzip dracula

# Copy relevant files
cp zsh-master/dracula.zsh-theme ./
cp -r zsh-master/lib ./

rm dracula.zip
rm -r zsh-master
