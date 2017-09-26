#/bin/bash

PARTITION_NAME=$1

if [ $# -ne 1 ]; then
    echo "Please provide the name of the disk partition like sda, sdb, etc."
    exit 1
fi

set -ex

# n=add a new partition
# Press enter for default, which would basically be the next available number
# Press enter for default First Sector
# Press enter for default Last Sector
# Press t to change a partition's system id
# Press enter to select the default Partition number
# Press 15 for selectig LVM
# Press w for writing it to the disk
echo -e "n\n\n\n\nt\n\n15\nw" | sudo fdisk /dev/$PARTITION_NAME

