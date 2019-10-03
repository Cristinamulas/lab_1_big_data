#!/bin/sh

../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /time_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /time_log/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /time_log/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../log_test1.txt/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../map_final.py -mapper ../../map_final.py \
-file ../../time_reduce.py -reducer ../../time_reduce.py \
-input /time_log/input/* -output /time_log/output/
/usr/local/hadoop/bin/hdfs dfs -cat /time_log/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /time_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /time_log/output/
../stop.sh
