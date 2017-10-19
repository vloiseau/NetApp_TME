#/bin/bash

PARTITION_NAME=$1

if [ $# -ne 1 ]; then
    echo "Please provide the name of the disk partition like sda, sdb, etc."
    exit 1
fi

set -ex

# d = delete a partition
# Press enter for default, which would basically be the last partition
# To make sure that we delete all partition, we will use d a few times
# n = add a new partition
# Press enter for default, which would basically be the next available number
# Press enter for default First Sector
# Press enter for default Last Sector
# Press t to change a partition's system id
# 12 = Linux filesystem 
# Press w for writing it to the disk
if [ ! $PARTITION_NAME == "sda" ]; then
    echo -e "d\nd\nd\nd\nn\n\n\n\nt\n12\nw" | sudo fdisk /dev/$PARTITION_NAME
elif [ $PARTITION_NAME == "sda" ]; then
    echo "Manually and carefully delete sda"
fi

