#/bin/bash

PARTITION_NAME=$1

if [ $# -ne 1 ]; then
    echo "Please provide the name of the disk partition like sda, sdb, etc."
    exit 1
fi

set -ex

# Create a GPT label first
sudo parted /dev/$PARTITION_NAME mklabel gpt

# Create the partition now
echo -e "mkpart primary xfs 1 -1\nquit" | sudo parted /dev/$PARTITION_NAME

