#/bin/bash

set -ex

# Go to home
cd /home/faiz89/

# Install jdk
sudo yum install java-1.7.0-openjdk-devel.x86_64 -y

# Download stable hadoop v2.7.4 if not already present
cd /home/faiz89/Downloads
if [ ! -f hadoop-2.7.4.tar.gz ]; then
    echo "Downloading hadoop..."
    wget http://archive.apache.org/dist/hadoop/core/stable/hadoop-2.7.4.tar.gz 
else
    echo "Hadoop v2.7.4 is already present."
fi

# Move it to /usr/local/src, untar it, and move it to /usr/local and rename it as hadoop
# Check if tar file already present in /usr/local/src
if [ ! -f /usr/local/src/hadoop-2.7.4.tar.gz ]; then
    echo "Moving the hadoop tar file to /usr/local/src"
    sudo mv hadoop-2.7.4.tar.gz /usr/local/src 
else
    echo "Hadoop v2.7.4 tar file already present in /usr/local/src"
fi

# Untar the file in /usr/local/src and move it to /usr/local and rename it as
# hadoop
# Check if a hadoop folder already exists in /usr/local
cd /usr/local/src
if [ ! -d /usr/local/hadoop ]; then
    sudo tar -xf hadoop-2.7.4.tar.gz && sudo mv hadoop-2.7.4 /usr/local && sudo
    mv /usr/local/hadoop-2.7.4 /usr/local/hadoop
    echo "Hadoop installed in /usr/local/hadoop."
else
    echo "Hadoop folder already exists in /usr/local/. Not overriding..."
fi

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

# Source the bashrc file
source ~/.bashrc

