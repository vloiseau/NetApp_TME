#!/bin/bash

# Install wget. Some systems didn't have it
CMD1="sudo yum install wget -y"
# Download EPEL Repository
CMD2="wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm"
# Enable EPEL Repository
CMD3="sudo rpm -ivh epel-release-7-10.noarch.rpm"
# Install epel
CMD4="sudo yum install epel-release -y"
# Install htop
CMD5="sudo yum install htop -y"
# Check if htop is installed or not
CMD6="yum list installed htop >/dev/null 2>&1"

# Function to check if htop is already installed
function isInstalled {
    if yum list installed htop >/dev/null 2>&1; then
        true
    else
        false
    fi
}

for ((i=136; i<=146; i+=2)); do
    # Check if htop is already installed
    if ssh faiz89@10.63.150.$i "$CMD6"; then
        echo "htop is already installed on 10.63.150.$i."
    # If not, try to install it
    else
        ssh -t -o ConnectTimeout=5 faiz89@10.63.150.$i "$CMD1 && $CMD2 && $CMD3 && $CMD4 && $CMD5"
        echo "Successfully installed htop on 10.63.150.$i."
    fi
done

