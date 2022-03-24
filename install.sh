#!/bin/bash

# Load colors
source install.d/colors.sh

# Working routines
# -------
symlink()
{
    # Backup old file if already exists
    backupname=$2
    backuptodo=false
    while [[ -f backupname ]]
    do
        backuptodo=true
        backupname+=".bak"
    done

    if [[ backuptodo ]]
    then
        mv $2 backupname
        echo "Backed up $backupname"
    fi

    ln -s $1 $2
    echo "Symlinked $2"
}

# Check dependencies
# ------------------------
echo "Installing dependencies..."

# Load dependency list
source install.d/dependencies.sh

echo "Detecting os and cpu architecture..."

if [[ $(source /etc/os-release | echo $NAME) == "void" ]]
then
   echo "Void Linux!"
   sudo xbps-install -Syu
   sudo xbps-install -Sy $DEPS_VOID_LINUX

   if [[ -n $(uname -a | grep x86_64) ]]
   then
       echo "x86_64!"
       sudo xbps-install -Sy $DEPS_VOID_LINUX_X86_64
   fi
fi

donewith "Done installing dependencies"

# Link config in .config
# ------------------------

echo "Creating .config if it doesn't exist already"
mkdir -p $HOME/.config

echo "Symlinking into .config"
pushd ./config
for f in *
do
    if [[ -f $f ]]
    then
        mv $f $f.old
    fi

    ln -s ${PWD}/$f ${HOME}/.config/$f
    echo "Symlinked $f"
done
popd

donewith "Done symlinking .config"

# Link config in home
# ------------------------

echo "Symlinking home"
pushd ./home
for f in *
do
    ln -s ${PWD}/$f ${HOME}/.$f
    echo "Symlinked $f"
done
popd

donewith "Done symlinking home"

# Link daemons
# ------------------------

echo "Symlinking daemons"

if [ -z $(which systemctl) ]
then
    echo "Systemd detected"
    mkdir -p ~/.config/systemd/user
    pushd ./daemons/systemd
    for f in ./*
    do
        ln -s ${PWD}/$f ${HOME}/.config/systemd/user/$f
        echo "Symlinked $f"
        systemctl enable --user $f
        systemctl start --user $f
    done
    popd
else
    echo "No suitable service manager detected... wth"
fi

donewith "Done symlinking daemons"

# Install stuff
# ------------------------

echo "Creating $HOME/.emacsinstalls"
mkdir -p $HOME/.emacsinstalls

echo "Fetching and installing tools and utils"
pushd ./install.d/scripts
for f in ./get*.sh
do
    echo "Executing $f"
    $f
done
popd
donewith "Done fetching tools and utils"

echo "Installing plug for neovim"
nvim +'PlugInstall --sync' +qa

echo "Applying fixes and tweaks"
pushd ./install.d/scripts
for f in ./fix*.sh
do
    echo "Executing $f"
    $f
done
popd
donewith "Done applying fixes"

echo "Enable the git credential storage"
git config credential.helper store

finaldone "Done with installation... Have a nice day!"
exit 0
