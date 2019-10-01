#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 30 18:39:22 2019

@author: cristinamulas
"""

../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../cristinamulas/lab_1_big_data/user_log/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../lab_1_big_data/user_log/ma_f.py -mapper ../../lab_1_big_data/user_log/map_f.py \
-file ../../lab_1_big_data/user_log/user_reduce.py -reducer ../../lab_1_big_data/user_log/user_reduce.py \
-input /logstat2/input/* -output /user_log/output/
/usr/local/hadoop/bin/hdfs dfs -cat /user_log/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /user_log/output/
../../stop.sh

