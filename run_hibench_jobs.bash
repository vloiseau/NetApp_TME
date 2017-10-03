#!/bin/bash

set -ex

# 1. Wordcount
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/micro/wordcount/hadoop/run.sh

# 2. Terrasort
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/micro/terasort/hadoop/run.sh

# 3. DFSIOE read
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_read.sh

# 4. DFSIOE write
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/micro/dfsioe/hadoop/run_write.sh

# 5. SQL Aggregation
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/sql/aggregation/hadoop/run.sh

# 6. SQL join
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/sql/join/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/sql/join/hadoop/run.sh

# 7. SQL scan
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/sql/scan/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/sql/scan/hadoop/run.sh

# 8. ML Bayes
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/ml/bayes/hadoop/run.sh

# 9. ML Kmeans
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/ml/kmeans/hadoop/run.sh

# 10. Pagerank
# Prepare the data first
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/prepare/prepare.sh
# Run the job
/home/faiz89/git/HiBench/bin/workloads/websearch/pagerank/hadoop/run.sh

