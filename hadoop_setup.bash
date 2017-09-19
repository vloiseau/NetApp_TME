#/bin/bash

set -ex

# Go to home
cd /home/faiz89/

# Install jdk
sudo yum install java-1.7.0-openjdk-devel.x86_64 -y

# Download stable hadoop v2.7.4
wget http://archive.apache.org/dist/hadoop/core/stable/hadoop-2.7.4.tar.gz 

# Move it to /usr/local/src, untar it, and move it to /usr/local and rename it as hadoop
sudo mv hadoop-2.7.4.tar.gz /usr/local/src && sudo untar -xf /usr/local/src/hadoop-2.7.4-src.tar.gz && sudo mv /usr/local/src/hadoop-2.7.4 /usr/local && sudo mv /usr/local/hadoop-1.7.4 /usr/local/hadoop

# Set JAVA_HOME in .bashrc file
# First, find the path
STR="$(java -XshowSettings:properties -version 2>&1 >/dev/null | grep 0java.home | awk '{print $3}')"

# STR would contain "/jre" in the end that we want to remove
STR="$(echo "${STR:0:${#STR}-4}")"

# Now put this path in .bashrc file if it already doesn't exists
if ! cat ~/.bashrc | grep JAVA_HOME 2>&1 >/dev/null; then
    echo 'export JAVA_HOME=$STR' >> ~/.bashrc
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
fi

# Check if Hadoop home is set
if ! cat ~/.bashrc | grep HADOOP_HOME 2>&1 >/dev/null; then
    echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.bashrc
    echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
fi


