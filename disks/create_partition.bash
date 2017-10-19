#/bin/bash

PARTITION_NAME=$1

if [ $# -ne 1 ]; then
    echo "Please provide the name of the disk partition like sda, sdb, etc."
    exit 1
fi

set -ex

# g=create a new GPT partition table. We need this because MBR can't support >2TB
# n=add a new partition
# Press enter for default, which would basically be the next available number
# Press enter for default First Sector
# Press enter for default Last Sector
# Press t to change a partition's system id
# Press enter to select the default Partition number. This won't be needed for any except sda, which is being used by root, swap, etc.
# Press 15 for selectig LVM
# Press w for writing it to the disk
if [ ! $PARTITION_NAME == "sda" ]; then
    echo -e "g\nn\n\n\n\nt\n15\nw" | sudo fdisk /dev/$PARTITION_NAME
elif [ $PARTITION_NAME == "sda" ]; then
    echo -e "n\n\n\n\nt\n\n15\nw" | sudo fdisk /dev/$PARTITION_NAME 
    # Need to reboot since sda was not unmounted and in use
    sudo reboot
fi

