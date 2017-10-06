#/bin/bash

set -ex

# Find out the process using the mount point and kill it
fuser -c /mnt/sdd1/ | awk '{print $1}' | xargs kill 
fuser -c /mnt/sde1/ | awk '{print $1}' | xargs kill 
fuser -c /mnt/sdf1/ | awk '{print $1}' | xargs kill 
fuser -c /mnt/sdg1/ | awk '{print $1}' | xargs kill 

if sudo umount /mnt/sdd1; then
    echo "Successfully unmounted /mnt/sdd1"
if sudo umount /mnt/sde1; then
    echo "Successfully unmounted /mnt/sde1" 
if sudo umount /mnt/sdf1; then
    echo "Successfully unmounted /mnt/sdf1"
if sudo umount /mnt/sdg1; then
    echo "Successfully unmounted /mnt/sdg1"

lsblk

