#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 30 19:01:47 2019

@author: cristinamulas
"""

import re
import sys
for line in sys.stdin:

    ip = r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
    time = r':\d{2}:\d{2}:\d{2}'

    time_list = re.findall(time, line)
    ips_list = re.findall(ip, line)
    for time, ip in zip(time_list , ips_list):
        new_list = '[' + time[1: 3] + ':' + '00'+']'+ ip + ' ' + '1'
        print(new_list) 