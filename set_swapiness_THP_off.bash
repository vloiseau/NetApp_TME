#/bin/bash

set -ex

# DOC: http://blog.cloudera.com/blog/2015/01/how-to-deploy-apache-hadoop-clusters-like-a-boss/
# Set swapiness to 1
for ((i=136; i<=146; i+=2)); do
    if ssh -t $i "sudo sh -c 'echo \"vm.swappiness = 1\" >> /etc/sysctl.conf'"; then
        echo "Successfully set swapiness to 1 for worker-$i"
    fi
done

# DOC: https://access.redhat.com/solutions/1320153
# Disable Transparent hugepages
CMD1="sudo sed -i '/GRUB_CMDLINE_LINUX/ s:\"\$:'\" transparent_hugepage=never\"'\":' /etc/default/grub"
for ((i=136; i<=146; i+=2)); do
    ssh -t -o ConnectTimeout=5 $i << HERE
    # Copy the grub file first
    sudo cp /etc/default/grub /home/faiz89
    # Make changes now
    if $CMD1; then
        echo "Successfully set transparent_hugepage=never on worker-$i in /etc/default/grub. Rebuilding grub now..."   
        # Copy the grub config file
        sudo cp /boot/grub2/grub.cfg /home/faiz89
        # Reconfigure the grub file now
        if sudo grub2-mkconfig -o /boot/grub2/grub.cfg; then
            echo "Successfully rebuilt grub file. Rebooting the system now for the changes to take effect."
            sudo reboot
        fi
    fi
HERE
done

