#/bin/bash

# Install lsof if not already there
# We will use this to check what open files are using the given filesystem
sudo yum install lsof -y

# Find out the process using the mount point and kill it
lsof | grep /mnt/sdd1/ | awk '{print $2}' | xargs kill
lsof | grep /mnt/sde1/ | awk '{print $2}' | xargs kill
lsof | grep /mnt/sdf1/ | awk '{print $2}' | xargs kill
lsof | grep /mnt/sdg1/ | awk '{print $2}' | xargs kill

# Unmount the filesystem
for i in sdd1 sde1 sdf1 sdg1; do
    if sudo umount /mnt/$i; then
        echo "Successfully unmounted /mnt/$i"
    fi
done

# Show the partitions
lsblk

