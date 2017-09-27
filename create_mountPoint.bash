#!/bin/bash

MOUNT_POINT_LOCATION=$1
LV=$2

if [ $# -ne 2 ]; then
    echo "Give the path of the mount point and the logical volume you are trying to point." 
    echo "For example, /mnt/sda4 and sda4-lvm etc."
    exit 1
fi

set -ex

# Create the mount folder first
sudo mkdir $MOUNT_POINT_LOCATION

# Mount the XFS file system to this mount point
if sudo mount /dev/hdfs_data/$LV $MOUNT_POINT_LOCATION; then
    echo "Successfully mounted $LV to $MOUNT_POINT_LOCATION"
    echo "Try "df -h" to confirm."
fi

