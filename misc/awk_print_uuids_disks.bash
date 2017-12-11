#!/bin/bash

echo UUID= | lsblk --fs | awk '$4 ~ /disk/ {print "UUID="$3,"\t",$4,"\t","xfs\tdefaults,noatime\t0\t0"}'
