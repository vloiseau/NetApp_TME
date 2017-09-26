#/bin/bash

LV=$1

if [ $# -ne 1 ]; then
    echo "Enter the name of a logical volume on which you are trying to install xfs like sda4-lvm etc."
    exit 1
fi

# Now create XFS filesystem on this newly created LV
sudo mkfs.xfs /dev/hdfs_data/$LV

