#!/bin/bash

DISK=$1
MOUNT_POINT_LOCATION==$2

if [ $# -ne 2 ]; then
    echo "Give the path of the disk trying to be mounted and the mount point." 
    echo "For example, sdm1 and disk1 etc."
    exit 1
fi

set -ex

# Create the mount folder first
#sudo mkdir $MOUNT_POINT_LOCATION

# Mount the XFS file system to this mount point
if sudo mount /dev/$DISK /mnt/$MOUNT_POINT_LOCATION; then
    echo "Successfully mounted $DISK to $MOUNT_POINT_LOCATION"
    echo "Try "df -h" to confirm."
fi

# Change the ownership of /mnt
#sudo chown -R faiz89:faiz89 /mnt

#echo "Remember to format the namenode afterwards."

