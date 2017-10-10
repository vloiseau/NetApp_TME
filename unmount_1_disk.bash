#/bin/bash


# Install lsof if not already there
CHECK_LSOF="sudo yum list installed lsof >/dev/null 2>&1"
INSTALL_LSOF="sudo yum install lsof -y"
KILL_PROCESS="sudo lsof | grep /mnt/sdd1/ | awk '{print \$2}' | xargs kill"

for ((i=136; i<=138; i+=2)); do
    ssh -t -o ConnectTimeout=5 $i << HERE
    # Commands to run on the remote host
    # Check if lsof is installed
    if ! eval $CHECK_LSOF; then
        echo "Installing lsof"
        eval $INSTALL_LSOF
    fi
    # Find out the process using the mount point and kill it
    #sudo lsof | grep /mnt/sdd1/ | awk '{print \$2}' | xargs kill
    #eval $KILL_PROCESS >/dev/null 2>&1
    # I tried using -f of umount, didn't work. The I started  checking the processes using that filesystem using lsof.
    # This seemed to work in the sense that I could unmount the filesystem but this also apparently killed the datanode daemon
    # Finally, found out a "lazy" way to unmount a filesystem using the -l flag
    # Now unmount it
    if sudo umount -l /mnt/sdd1 && sudo umount -l /mnt/sde1 && sudo umount -l /mnt/sdf1; then
        echo "Successfully unmounted /mnt/sdd1, /mnt/sde1, and /mnt/sdf1 from worker-$i"
    fi
HERE
done

