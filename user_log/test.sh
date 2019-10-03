#!/usr/bin/

../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../log_test1.txt/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../ma_f.py -mapper ../../map_f.py \
-file ../../user_reduce.py -reducer ../../user_reduce.py \
-input /user_log/input/* -output /user_log/output/
/usr/local/hadoop/bin/hdfs dfs -cat /user_log/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/output/
../stop.sh

