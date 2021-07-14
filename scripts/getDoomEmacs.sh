#!/bin/sh

DOOM_INSTALL_DIR="$HOME/.emacs.d"

git clone --depth 1 https://github.com/hlissner/doom-emacs $DOOM_INSTALL_DIR

# https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#the-bindoom-utility

# So we don't have to write ~/.emacs.d/bin/doom every time
PATH="$DOOM_INSTALL_DIR/bin:$PATH"

doom sync

doom env

emacs --batch -f all-the-icons-install-fonts
