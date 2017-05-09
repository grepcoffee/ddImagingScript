#!/bin/bash
while true; do
    read -p "Are you Running a Mac?" yn
    case $yn in
        [Yy]* ) echo "You have specified your system as Mac" && diskutil list;;
        [Nn]* ) echo "You have specified your system as Linux" && fdisk -l;;
        * ) echo "Please answer yes or no.";;
    esac
    break
done
echo "################################################################################################"
echo "Type the disk name, followed by [ENTER]: ex.(disk2)"
read disk
echo "################################################################################################"
echo "Would you like to wipe your drive using "urandom" or "zero"? Please specify,followed by [ENTER]:"
read wpefrm
sudo dd if=/dev/$wpefrm of=/dev/$disk
echo -e "############## Image Complete ##############"
echo "################################################################################################"
read -s -r -p "Press any key to exit"
