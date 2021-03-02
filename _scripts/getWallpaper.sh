#!/bin/bash

echo Checking if wallpaper directory exists....

if [[ ! -d "./awesome/wp" ]]
then
   mkdir ./awesome/wp
   echo Created wallpaper directory
fi

wget https://i.pinimg.com/originals/47/0a/19/470a19a36904fe200610cc1f41eb00d9.jpg -O ./awesome/wp/default.jpg
mogrify -format png ./awesome/wp/default.jpg
