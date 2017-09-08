#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please proide the username."
    exit 1
fi

USERNAME=$1

adduser $USERNAME 

# Make the user a sudo
usermod -aG wheel $USERNAME

echo $USERNAME is a sudo user on $(hostname)

