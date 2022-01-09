#!/bin/bash

# Definitions
# ------------------------
# Thanks to demure for the color snippet
# Sauce: https://stackoverflow.com/questions/16843382/colored-shell-script-output-library
RCol='\e[0m'    # Text Reset

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

# Status
# -------
error()
{
    echo -e "${Red}$@${RCol}"
    exit 1
}

donewith()
{
    echo -e "${Gre}$@${RCol}"
}

finaldone()
{
    echo -e "${UGre}$@${RCol}"
}

# Working routines 
# -------
symlink()
{
    ln -s $1 $2
    echo "Symlinked $2"
}

# Check dependencies
# ------------------------
echo "Installing dependencies..."

# DEPS=(nvim curl emacs doas zsh pip cmake clang tmux python3)
#for dep in "${DEPS[@]}"
#do
#    if [ -z $(which $dep) ]
#    then
#        error "Error: $dep missing... Install $dep"
#    else
#        echo "Found $dep"
#    fi
#done

DEPS_VOID_LINUX=(neovim curl emacs-gtk3 zsh cmake clang tmux python3 python3-devel python3-pip nodejs)
#DEPS_ARCH_LINUX=()
#DEPS_DEBIAN_LINUX=()
#DEPS_GENTOO_LINUX=()

echo "Detecting os..."

if [[ $(source /etc/os-release | echo $NAME) == "void" ]]
<<<<<<< Updated upstream
then
   echo "Void Linux!"
   sudo xbps-install -Syu
   sudo xbps-install -Sy $DEPS_VOID_LINUX
fi

# DEPS=(nvim curl emacs doas zsh pip cmake clang tmux python3)
#for dep in "${DEPS[@]}"
#do
#    if [ -z $(which $dep) ]
#    then
#        error "Error: $dep missing... Install $dep"
#    else
#        echo "Found $dep"
#    fi
#done

DEPS_VOID_LINUX=(neovim curl emacs-gtk3 zsh cmake clang tmux python3 python3-devel python3-pip nodejs)
#DEPS_ARCH_LINUX=()
#DEPS_DEBIAN_LINUX=()
#DEPS_GENTOO_LINUX=()

echo "Detecting os..."

if [[ $(source /etc/os-release | echo $NAME) == "void" ]]
=======
>>>>>>> Stashed changes
then
   echo "Void Linux!"
   sudo xbps-install -Syu
   sudo xbps-install -Sy $DEPS_VOID_LINUX
fi
>>>>>>> Stashed changes

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
pushd ./scripts
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
pushd ./scripts
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
