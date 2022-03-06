#!/bin/bash

# Definitions
print_usage_and_exit(){
	echo "Usage: ./make-chroot.sh -a <arch> -c <libc type> -d [directory to create chroot in]"
	echo "Options: "
	echo "    arch:"
	echo "        x86_64"
	echo "        i686"
	echo "        armv6l"
	echo "        armv7l"
	echo "        aarch64"
	echo "        rpi"
	echo "        rpi2"
	echo "        rpi3"
	echo "        rpi4"
	echo "    libc type:"
	echo "	      glibc : Use the libc provided by GNU"
	echo "	      musl	: Use the musl libc"
	exit 1
}

print_root_and_exit(){
	echo "Insufficient privileges... Please execute this script as root."
	exit 1
}

print_dependencies_and_exit(){
	echo "Not all dependencies could be met. Please install the following"
	echo "Either: wget or curl"
}

create_file_chroot(){

}

download_file_as(){
	
}

# Check if root
if [ "$EUID" -ne 0 ]
then
	print_root_and_exit
fi

# Check for dependencies and configure
if [[ -z $(command -v wget) ]]

# Check for argument
while getopts c:d: flag
do
    case "${flag}" in
        c) libc=${OPTARG};;
        d) directory=${OPTARG};;
    esac
done

# Make sure directory exists
mkdir -p ${directory}
pushd ${directory}

# Get all available download links
rootfs_base_url = "https://alpha.de.repo.voidlinux.org/live/current/"

if [[ ${libc} == "musl" ]]
then

elif [[ ${libc} == "glibc" ]]

fi

# Download tarball
wget ${rootfs_url}

# Check checksum and hash

# Extract to root directory
mkdir root

# Create scripts and make them executable
create_file_chroot

# Finally, exit
exit 0
