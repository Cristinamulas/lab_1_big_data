../../start.sh\
/usr/local/hadoop/bin/hdfs dfs -rm -r /log_hw/input/\
/usr/local/hadoop/bin/hdfs dfs -rm -r /log_hw/output/\
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /log_hw/input/\
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../cristinamulas/log_hw/input/\
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \\\
-file ../../cristinamulas/log_hw/map_f.py -mapper ../../cristinamulas/log_hw/map_f.py \\\
-file ../../cristinamulas/log_hw/reduce_f.py -reducer ../../cristinamulas/log_hw/reduce_f.py \\\
-input /log_hw/input/* -output /log_hw/output/\
/usr/local/hadoop/bin/hdfs dfs -cat /log_hw/output/part-00000\
/usr/local/hadoop/bin/hdfs dfs -rm -r /log_hw/input/\
/usr/local/hadoop/bin/hdfs dfs -rm -r /log_hw/output/\
../../stop.sh\
