#/bin/bash

# REQUIREMENTS
# 1. Apache Maven - https://maven.apache.org/
# 2. JDK development environment, not JRE. I did "sudo yum install java-1.8.0-openjdk-devel.x86_64"

set -ex

# https://github.com/intel-hadoop/HiBench
# Check if git repo for HiBench already exists
if [ ! -d '/home/faiz89/git/HiBench' ]; then
    git clone https://github.com/intel-hadoop/HiBench.git
else
    echo "HiBench git repo already present in /home/faiz89/git. Not downloading again..."
fi

# Build everything
cd /home/faiz89/git/HiBench/bin && ./build_all.sh 

