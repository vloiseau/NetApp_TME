#!/bin/bash

set -e

CMD="ssh-copy-id"
#PERMISSION="$(stat -c "%a %n" .ssh/ | awk '{print $1}')"

for ((i=136; i<=146; i+=2));do
    ssh -o ConnectTimeout=5 faiz89@10.63.150.$i 'bash -s' <<'ENDSSH'
    # Commands to run on the remote host
    # Check if .ssh folder exists. If not, create it
    if [ ! -d '/home/faiz89/.ssh' ]; then
        mkdir ~/.ssh
        echo ".ssh folder created on 10.63.150.$i"
    fi
    # Check permission on .ssh folder. Make it 700 if not
    if [ $(stat -c "%a %n" .ssh/ | awk '{print $1}') -ne 700 ]; then
        chmod 700 ~/.ssh
        echo "Changed the .ssh folder permissions to 700."
    fi
ENDSSH
    # Copy keys
    if $CMD faiz89@10.63.150.$i; then
        echo "Key successfully copied to 10.63.150.$i."
    fi
done

