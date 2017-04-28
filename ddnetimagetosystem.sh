#!/bin/bash
TMPDIR="/tmp/images"
DISK="/dev/sda" #change this to what your disk is
echo "Image Creation Script"
echo -e "Mounting Local Drive ${DISK}..."
sudo mkdir ${TMPDIR} ||
{ echo "Failed creating $TMPDIR."; exit 1; }

sudo mount.cifs //drive/source -o username=admin,password=password, ${TMPDIR}
#you can change this to ftp, sftp or anything of your choice.

dd if=${TMPDIR}/Image1 of=${DISK}

echo -e "Image Complete"

ignored="" # Yep. This is an ignored variable.

read -s -r -p "Press any key to power this machine off" -n 1 ignored
sudo shutdown
