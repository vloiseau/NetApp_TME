#!/bin/bash

# We only need to create data once

set -ex

# 1. Wordcount
# Prepare the data first
echo "Starting wc data preparation at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/prepare/prepare.sh 
echo "Finished wc data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 2. Terrasort
# Prepare the data first
echo "Starting ts data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/prepare/prepare.sh
# Sleep for 5 minutes
echo "Finished ts data preparation job at" $(date +"%T")
sleep 5m

# 3. DFSIOE read
# Prepare the data first
echo "Starting dfsio read data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
echo "Finished dfsio read data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 4. DFSIOE write
# Prepare the data first
echo "Starting dfsio write data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
echo "Finished dfsio write data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 5. SQL Aggregation
# Prepare the data first
echo "Starting sql aggregation data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/prepare/prepare.sh
echo "Finished sql aggregation data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 6. SQL join
# Prepare the data first
echo "Starting sql join data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/join/prepare/prepare.sh
echo "Finished sql join data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 7. SQL scan
# Prepare the data first
echo "Starting sql scan data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/sql/scan/prepare/prepare.sh
echo "Finished sql scan data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 8. Pagerank
# Prepare the data first
echo "Starting pagerank data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/prepare/prepare.sh
echo "Finished pagerank data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 9. ML Bayes
# Prepare the data first
echo "Starting ml bayes data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/prepare/prepare.sh
echo "Finished ml bayes data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

# 10. ML Kmeans
# Prepare the data first
echo "Starting ml kmeans data preparation job at" $(date +"%T")
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/prepare/prepare.sh
echo "Finished ml kmeans data preparation job at" $(date +"%T")
# Sleep for 5 minutes
sleep 5m

echo "All data generation jobs finished running. Now start the actual jobs!"

