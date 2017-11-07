#!/bin/bash

set -ex

# 1. Wordcount
# Run the job
echo "Starting wc job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh \
	> /home/faiz89/wc_output.txt
echo "Finished wc job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 2. Terrasort
# Run the job
echo "Starting ts job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh \
	> /home/faiz89/ts_output.txt
echo "Finished ts job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# Use bigdata for DFSIO tests
#sed -i 's/gigantic/bigdata/g' /home/faiz89/git/HiBench/conf/hibench.conf

# For DFSIO tests, the job errs out if I try to save the output to a text file. 
# 3. DFSIOE read
# Run the job
echo "Starting dfsio read job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh
echo "Finished dfsio read job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 4. DFSIOE write
# Run the job
echo "Starting dfsio write job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh
echo "Finished dfsio write job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# Move back to gigantic data
#sed -i 's/bigdata/gigantic/g' /home/faiz89/git/HiBench/conf/hibench.conf

# 5. SQL Aggregation
# Run the job
echo "Starting sql aggregation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh \
	> /home/faiz89/sql_aggre_output.txt
echo "Finished sql aggregation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 6. SQL join
# Run the job
echo "Starting sql join job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh \
	> /home/faiz89/sql_join_output.txt
echo "Finished sql join job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 7. SQL scan
# Run the job
echo "Starting sql scan job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh \
	> /home/faiz89/sql_scan_output.txt
echo "Finished sql scan job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 8. Pagerank
# Run the job
echo "Starting pagerank job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh \
	> /home/faiz89/pagerank_output.txt
echo "Finished pagerank job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# ML jobs take a lot more time than others. Hence, running at the end
# 9. ML Kmeans
# Run the job
echo "Starting ml kmeans job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh \
	> /home/faiz89/ml_kmeans.txt
echo "Finished ml kmeans job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 10. ML Bayes
# Run the job
echo "Starting ml bayes job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/hadoop/run.sh \
	> /home/faiz89/ml_bayes_output.txt
echo "Finished ml bayes job at" $(date +"%T")

echo "All jobs finished running. Check hibench.report for the status. Also look at Ganglia." 

