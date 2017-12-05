#!/bin/bash

set -ex

# 1. Wordcount

# Prepare the data first
echo "Starting wc data preparation at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/prepare/prepare.sh 
sleep 1m
# Run the job
echo "Starting wc job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh 
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh
echo "Finished wc job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

: >> 'START'
# 2. Terrasort
# Prepare the data first
echo "Starting ts data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting ts job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh \
	> /home/faiz89/ts_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh \
	> /home/faiz89/ts_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh \
	> /home/faiz89/ts_output3.txt
echo "Finished ts job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# Use bigdata for DFSIO tests
#sed -i 's/gigantic/bigdata/g' /home/faiz89/git/HiBench/conf/hibench.conf

# For DFSIO tests, the job errs out if I try to save the output to a text file. 

# 3. DFSIOE write
# Prepare the data first
echo "Starting dfsio read data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting dfsio write job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh
echo "Finished dfsio write job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 4. DFSIOE read
# Prepare the data first
echo "Starting dfsio read data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting dfsio read job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh
echo "Finished dfsio read job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m
START

# Move back to gigantic data
#sed -i 's/bigdata/gigantic/g' /home/faiz89/git/HiBench/conf/hibench.conf

# 5. SQL Aggregation
# Prepare the data first
echo "Starting sql aggregation data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting sql aggregation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh
echo "Finished sql aggregation job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 6. SQL join
# Prepare the data first
echo "Starting sql join data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting sql join job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh
echo "Finished sql join job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 7. SQL scan
# Prepare the data first
echo "Starting sql scan data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting sql scan job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh
echo "Finished sql scan job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 8. Pagerank
# Prepare the data first
echo "Starting pagerank data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting pagerank job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh
echo "Finished pagerank job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# ML jobs take a lot more time than others. Hence, running at the end
# 9. ML Kmeans
# Prepare the data first
echo "Starting ml kmeans data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/prepare/prepare.sh
sleep 1m
# Run the job
echo "Starting ml kmeans job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh
echo "Finished ml kmeans job at" $(date +"%T")
# Sleep for 1 minute
#sleep 1m

# Not running Bayes since Bigdata was taking forever to complete
# 10. ML Bayes
# Run the job
#echo "Starting ml bayes job at" $(date +"%T")
#/home/faiz89/git/HiBench/bin/workloads/ml/bayes/hadoop/run.sh \
#	> /home/faiz89/ml_bayes_output.txt
#echo "Finished ml bayes job at" $(date +"%T")

echo "All jobs finished running. Check hibench.report for the status. Also look at Ganglia." 

