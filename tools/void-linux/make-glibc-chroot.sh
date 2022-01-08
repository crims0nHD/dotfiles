#!/bin/bash

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

print_usage_and_exit(){
	echo "Usage: ./make-chroot.sh -c [musl|glibc] -d [directory to create chroot in]"
	exit 1
}

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

# Download tarball
wget https://alpha.de.repo.voidlinux.org/live/current/void-x86_64-ROOTFS-20210930.tar.xz



