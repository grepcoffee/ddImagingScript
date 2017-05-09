#!/bin/bash
#author: Jeff
#website: http://jmatt.io
#website: https://alleycyber.com
#twitter: @jmatt_io
TMPDIR="/tmp/images"
echo "System Imaging Script"
echo -e "Mounting Local Drive ${DISK}..."
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
echo "Would you like to wipe your drive using "urandom" or "zero"? Please type and press [ENTER]:"
read wpefrm
sudo dd if=/dev/$wpefrm of=/dev/$disk
echo -e "Wiping Complete"
echo "################################################################################################"
#makes a temporary directory on the host system to mount network storage
sudo mkdir ${TMPDIR} ||
{ echo "Failed creating $TMPDIR."; exit 1; }
#mounts network storage. you can change this to ftp aswell.
sudo mount.cifs //drive/source -o username=admin,password=password, ${TMPDIR}
#wipes the drive.
#starts imaging the drive selected above
dd if=${TMPDIR}/Image1 of=/dev/$disk
echo -e "Image Complete"
ignored="" #ignored variable
#powers off or ignores the shutdown command.
read -s -r -p "Press any key to power this machine off" -n 1 ignored
sudo shutdown
