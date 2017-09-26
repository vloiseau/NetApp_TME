#/bin/bash

PARTITION_NAME=$1

if [ $# -eq 1 ]; then
    echo "Enter the partition name like sda4, sdb1, etc."
    exit 1
fi

set -ex

# Create a physical volume on PARTITION_NAME
sudo pvcreate /dev/$PARTITION_NAME

# Check of a volume group by the name of hdfs_data has already been created.
# If not, create one
if [ ! -d '/dev/hdfs_data' ]; then
    sudo vgcreate hdfs_data /dev/$PARTITION_NAME
else
    # And next time, just extend the VG hdfs_data like below:
    sudo vgextend hdfs_data /dev/$PARTITION_NAME
fi

# Create a logical volume with all the remaining space in the VG
sudo lvcreate -n $PARTITION_NAME-lvm -l 100%FREE hdfs_data

