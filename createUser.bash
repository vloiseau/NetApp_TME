#!/bin/bash

USERNAME=$1
PASSWD=$2

if [$# -ne 1]; then
    echo "Please proide the username."
    exit 1
fi

adduser $USERNAME 
passwd $USERNAME

# Make the user a sudo
usermod -aG wheel $USERNAME

echo $USERNAME is a sudo user on $hostname

