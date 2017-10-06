#/bin/bash

# Unmount the filesystem
for ((i=136; i<=146; i+=2)); do
    if ssh -t $i \
            'sudo mount /dev/hdfs_data/sdd1-lvm /mnt/sdd1'; then
            #sudo mount /dev/hdfs_data/sde1-lvm /mnt/sde1 && \
            #sudo mount /dev/hdfs_data/sdf1-lvm /mnt/sdf1 && \
            #sudo mount /dev/hdfs_data/sdg1-lvm /mnt/sdg1'
        echo "Successfully mounted /mnt/sdd1"
    fi
done

