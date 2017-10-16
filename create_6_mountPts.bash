#/bin/bash

TO_BE_REMOVED=$1
TO_EXTEND=$2

if [ $# != 2 ]; then
    echo "Enter the lv to be removed and the lv to be extended."
    echo "For example, remove sdb1-lvm and extend sda4-lvm

# Unmount the lv
sudo umount /dev/hdfs_data/$TO_BE_REMOVED
# Remove the lv
echo y | sudo lvremove /dev/hdfs_data/$TO_BE_REMOVED 
# Extend the other lv
sudo lvextend -l +100%FREE /dev/hdfs_data/$TO_EXTEND

