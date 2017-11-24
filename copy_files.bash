#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -ex

if [ $# -ne 2 ]; then
	echo "No arguments provided. Give the filename and path on the remote server to copy."
	exit 1
fi

FILENAME=$1
REMOTEPATH=$2

for i in 136 138 140 142 144 146 163 165; do
    # Copy the file to the home in any case and then sudo mv it just in case
    # file needs to be moved to a sudo location
    if scp -r -o ConnectTimeout=5 $FILENAME $i:; then
        echo "Successfully copied to home folder. Now going to move it to $REMOTEPATH'"
    fi
    if ssh -t $i "sudo mv $FILENAME $REMOTEPATH"; then
		echo "10.63.150.$i done."
	else
		echo "10.63.150.$i is not reachable."
	fi
done
    
