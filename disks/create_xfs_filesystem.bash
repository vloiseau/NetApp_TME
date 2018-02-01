#/bin/bash

PARTITION=$1

if [ $# -ne 1 ]; then
    echo "Enter the name of the partition on which you are trying to install xfs. For example sdb1, sdc1 etc."
    exit 1
fi

# Now create XFS filesystem on this newly created partition
sudo mkfs.xfs -f -d su=1m,sw=8 /dev/$PARTITION

