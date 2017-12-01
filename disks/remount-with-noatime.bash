#!/bin/bash

for i in a4 b1 c1 d1 e1 f1 g1 h1 i1 j1 k1 l1; do
	if sudo mount -o remount,noatime   /dev/sd$i;then
		echo "Successfully remounted /mnt/sd$i"
	fi
done
