#!/bin/bash

# Teragen
#RUN 1
# Remove the data first
hadoop fs -rm -r  /HiBench/Dfsioe/terasort-input
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -D mapreduce.job.maps=304 -D mapreduce.job.reduces=304 10995116277 /HiBench/Dfsioe/terasort-input

#RUN 2
# Remove the data first
hadoop fs -rm -r  /HiBench/Dfsioe/terasort-input
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -D mapreduce.job.maps=304 -D mapreduce.job.reduces=304 10995116277 /HiBench/Dfsioe/terasort-input

#RUN 3
# Remove the data first
hadoop fs -rm -r  /HiBench/Dfsioe/terasort-input
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -D mapreduce.job.maps=304 -D mapreduce.job.reduces=304 10995116277 /HiBench/Dfsioe/terasort-input
#############################################################################################
# Terasort
#RUN 1
# Remove the old output
hadoop fs -rm -r /HiBench/Dfsioe/terasort-output
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort -D mapreduce.job.reduces=304 /HiBench/Dfsioe/terasort-input /HiBench/Dfsioe/terasort-output

#RUN 1
# Remove the old output
hadoop fs -rm -r /HiBench/Dfsioe/terasort-output
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort -D mapreduce.job.reduces=304 /HiBench/Dfsioe/terasort-input /HiBench/Dfsioe/terasort-output

#RUN 1
# Remove the old output
hadoop fs -rm -r /HiBench/Dfsioe/terasort-output
# Run the job
/usr/hdp/2.6.2.0-205/hadoop/bin/hadoop --config /usr/hdp/2.6.2.0-205/hadoop/etc/hadoop jar /usr/hdp/2.6.2.0-205/hadoop/../hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort -D mapreduce.job.reduces=304 /HiBench/Dfsioe/terasort-input /HiBench/Dfsioe/terasort-output
#############################################################################################
# DFSIO WRITE
hadoop jar /usr/hdp/2.6.2.0-205/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-tests.jar TestDFSIO -write -nrFiles 256 -fileSize 4096
#############################################################################################
# DFSIO READ
hadoop jar /usr/hdp/2.6.2.0-205/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-tests.jar TestDFSIO -read -nrFiles 256 -fileSize 4096

