#!/bin/bash

set -ex

# 1. Wordcount
# Prepare the data first
echo "Starting wc data preparation at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/prepare/prepare.sh 
echo "Finished wc data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting wc job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh \
	&> /home/faiz89/wc_output.txt
echo "Finished wc job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 2. Terrasort
# Prepare the data first
echo "Starting ts data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/prepare/prepare.sh
# Sleep for 5 minutes
echo "Finished ts data preparation job at" $(date +"%T")
sleep 5m
# Run the job
echo "Starting ts job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh \
	&> /home/faiz89/ts_output.txt
echo "Finished ts job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# Use bigdata for DFSIO tests
#sed -i 's/gigantic/bigdata/g' /home/faiz89/git/HiBench/conf/hibench.conf

# For DFSIO tests, the job errs out if I try to save the output to a text file. 
# 3. DFSIOE read
# Prepare the data first
echo "Starting dfsio read data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
echo "Finished dfsio read data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting dfsio read job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh
echo "Finished dfsio read job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 4. DFSIOE write
# Prepare the data first
echo "Starting dfsio write data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
echo "Finished dfsio write data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting dfsio write job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh
echo "Finished dfsio write job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# Move back to gigantic data
#sed -i 's/bigdata/gigantic/g' /home/faiz89/git/HiBench/conf/hibench.conf

# 5. SQL Aggregation
# Prepare the data first
echo "Starting sql aggregation data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/prepare/prepare.sh
echo "Finished sql aggregation data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting sql aggregation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh \
	&> /home/faiz89/sql_aggre_output.txt
echo "Finished sql aggregation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 6. SQL join
# Prepare the data first
echo "Starting sql join data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/prepare/prepare.sh
echo "Finished sql join data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting sql join job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh \
	&> /home/faiz89/sql_join_output.txt
echo "Finished sql join job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 7. SQL scan
# Prepare the data first
echo "Starting sql scan data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/prepare/prepare.sh
echo "Finished sql scan data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting sql scan job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh \
	&> /home/faiz89/sql_scan_output.txt
echo "Finished sql scan job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 8. Pagerank
# Prepare the data first
echo "Starting pagerank data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/prepare/prepare.sh
echo "Finished pagerank data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting pagerank job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh \
	&> /home/faiz89/pagerank_output.txt
echo "Finished pagerank job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# ML jobs take a lot more time than others. Hence, running at the end
# 9. ML Bayes
# Prepare the data first
echo "Starting ml bayes data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/prepare/prepare.sh
echo "Finished ml bayes data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting ml bayes job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/hadoop/run.sh \
	&> /home/faiz89/ml_bayes_output.txt
echo "Finished ml bayes job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 10. ML Kmeans
# Prepare the data first
echo "Starting ml kmeans data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/prepare/prepare.sh
echo "Finished ml kmeans data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m
# Run the job
echo "Starting ml kmeans job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh \
	&> /home/faiz89/ml_kmeans.txt
echo "Finished ml kmeans job at" $(date +"%T")

echo "All jobs finished running. Check hibench.report for the status. Also look at Ganglia." 

