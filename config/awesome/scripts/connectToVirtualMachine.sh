#!/bin/bash
virtualMachines="$(virsh list | \
	grep -v "Id" | \
	grep -v "\-\-\-" | \
	awk '{print $2;}')"

selected=$(echo $virtualMachines | rofi -dmenu -p "VM: ")

if [ ! -z $(echo $virtualMachines | grep $selected) ]
then
	viewercmd='virt-viewer --attach --connect qemu:///session '
	awesome-client "require(\"awful\").util.spawn(\"$viewercmd $selected\")"
fi
