#/bin/bash

# Kill any existing running processes
ps -ef | grep hdfs | awk '{print $2}' | xargs kill
ps -ef | grep yarn | awk '{print $2}' | xargs kill
ps -ef | grep history | awk '{print $2}' | xargs kill
ps -ef | grep ganglia | awk '{print $2}' | xargs kill

# Run the scripts and background them
xterm -e "ssh -L50070:10.63.150.51:50070 51" &
xterm -e "ssh -L8088:10.63.150.53:8088 53" &
xterm -e "ssh -L19888:10.63.150.51:19888 51" &
xterm -e "ssh -L7000:10.63.150.53:80 53" &

echo "HDFS - localhost:50070"
echo "Yarn - localhost:8088"
echo "History server - localhost:19888"
echo "Ganglia - localhost:7000"

