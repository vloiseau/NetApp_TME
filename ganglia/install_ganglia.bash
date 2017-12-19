#!/bin/bash

# On the server
sudo yum update -y && sudo yum install epel-release -y
sudo yum install ganglia rrdtool ganglia-gmetad ganglia-gmond ganglia-web -y

# Make change to the /etc/ganglia/gmetad.conf
# Also make changes to /etc/ganglia/gmond.conf
# See here for reference - https://www.digitalocean.com/community/tutorials/introduction-to-ganglia-on-ubuntu-14-04

# Restart ganglia
sudo service httpd restart
sudo service gmetad restart
sudo service gmond restart

# On the worker nodes
sudo yum install ganglia-gmond -y
# Copy the same gmond file from the server to this host
# Restart gmond
sudo service gmond restart
