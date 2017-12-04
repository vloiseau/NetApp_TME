#!/bin/bash

set -ex

# 1. Wordcount
# Run the job
echo "Starting wc job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh \
	> /home/faiz89/wc_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh \
	> /home/faiz89/wc_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh \
	> /home/faiz89/wc_output3.txt
echo "Finished wc job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 2. Terrasort
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


# Move back to gigantic data
#sed -i 's/bigdata/gigantic/g' /home/faiz89/git/HiBench/conf/hibench.conf

# 5. SQL Aggregation
# Run the job
echo "Starting sql aggregation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh \
	> /home/faiz89/sql_aggre_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh \
	> /home/faiz89/sql_aggre_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh \
	> /home/faiz89/sql_aggre_output3.txt
echo "Finished sql aggregation job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 6. SQL join
# Run the job
echo "Starting sql join job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh \
	> /home/faiz89/sql_join_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh \
	> /home/faiz89/sql_join_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh \
	> /home/faiz89/sql_join_output3.txt
echo "Finished sql join job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 7. SQL scan
# Run the job
echo "Starting sql scan job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh \
	> /home/faiz89/sql_scan_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh \
	> /home/faiz89/sql_scan_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh \
	> /home/faiz89/sql_scan_output3.txt
echo "Finished sql scan job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# 8. Pagerank
# Run the job
echo "Starting pagerank job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh \
	> /home/faiz89/pagerank_output1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh \
	> /home/faiz89/pagerank_output2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh \
	> /home/faiz89/pagerank_output3.txt
echo "Finished pagerank job at" $(date +"%T")
# Sleep for 1 minute
sleep 1m

# ML jobs take a lot more time than others. Hence, running at the end
# 9. ML Kmeans
# Run the job
echo "Starting ml kmeans job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh \
	> /home/faiz89/ml_kmeans1.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh \
	> /home/faiz89/ml_kmeans2.txt
sleep 1m
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh \
	> /home/faiz89/ml_kmeans3.txt
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

