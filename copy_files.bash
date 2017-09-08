#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

if [ $# -ne 3 ]; then
	echo "No arguments provided. Give the username, filename, and path on the remote server to copy."
	exit 1
fi

USER=$1
FILENAME=$2
REMOTEPATH=$3

for ((i=136; i<=146; i=i+2)); do
    if scp -r -o ConnectTimeout=5 $FILENAME $user@10.63.150.$i:$REMOTEPATH; then
		echo "10.63.150.$i done."
	else
		echo "10.63.150.$i is not reachable."
	fi
done
    
