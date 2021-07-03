#!/bin/sh
if [ -n $(which pip) ]
then
	pip install neovim
else
	echo "Pip not found... Please install pip and re-run this script!"
fi
