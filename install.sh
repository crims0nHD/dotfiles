#!/bin/sh

# Check dependencies
# ------------------------

echo "Checking dependencies..."

DEPS=(nvim curl emacs doas zsh pip cmake clang tmux)
for dep in "${DEPS[@]}"
do
    if [ -z $(which $dep) ]
    then
        echo "Error: $dep missing... Install $dep"
        exit 1
    else
        echo "Found $dep"
    fi
done

if [ $(find "/usr/include/python3.9/" -type f | wc -l) -lt 10 ]
then
    echo "Python headers not found... Install python3-devel or similar"
    exit 1
fi

echo "Done checking dependencies"

# Link config in .config
# ------------------------

echo "Creating .config if it doesn't exist already"
mkdir -p $HOME/.config

echo "Symlinking into .config"
pushd ./config
for f in ./*
do
    ln -s ${PWD}/$f ${HOME}/.config/$f
    echo "Symlinked $f"
done
popd

echo "Done symlinking .config"

# Link config in home
# ------------------------

echo "Symlinking home"
pushd ./home
for f in ./*
do
    ln -s ${PWD}/$f ${HOME}/$f
    echo "Symlinked $f"
done
popd

echo "Done symlinking home"

# Install stuff
# ------------------------

echo "Fetching and installing tools and utils"
pushd ./scripts
for f in ./get*.sh
do
    echo "Executing $f"
    $f
done
popd
echo "Done fetching tools and utils"

echo "Installing plug for neovim"
nvim +'PlugInstall --sync' +qa

echo "Applying fixes and tweaks"
pushd ./scripts
for f in ./fix*.sh
do
    echo "Executing $f"
    $f
done
popd
echo "Done applying fixes"

echo "Done with installation... Have a nice day!"
