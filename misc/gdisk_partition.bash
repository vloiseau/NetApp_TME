#/bin/bash

# Install gdisk
sudo yum install gdisk.x86_64

#d   delete a partition
#w   write table to disk and exit
#y Do you want to proceed? (Y/N)

# Delete existing partitions
for i in sdb sdc sdd sde sdf sdg sdh sdi sdj sdk sdl; do
    echo -e "d\nw\ny" | sudo gdisk /dev/$i
done

# Create New Partitions
#n   add a new partition
#n8e00 - Linux LVM
for i in sdb sdc sdd sde sdf sdg sdh sdi sdj sdk sdl; do
    echo -e "n\n\n\n\n8e00\nw\ny" | sudo gdisk /dev/$i
done

# Now run the create_lvm_partition.bash script

:
