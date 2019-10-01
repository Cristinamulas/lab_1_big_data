#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 30 15:11:02 2019

@author: cristinamulas
"""
import sys
import re
from collections import Counter


ip_dict ={}
pat = re.compile('(?P<ip>\d+\.\d+\.\d+\.\d+).*?(?P<hour>(?<=:)\d\d)')
for line in sys.stdin:
    match = pat.search(line)
    if match:
        ip_key = match.group('ip')
        hour_key = match.group('hour')
        ip_dict[(ip_key,hour_key)] = ip_dict.get((ip_key,hour_key),0)+1
           



ip_dict ={}
pat = re.compile('(?P<ip>\d+\.\d+\.\d+\.\d+).*?(?P<hour>(?<=:)\d\d)')
for line in sys.stdin:
    match = pat.search(line)
    if match:
        ip_key = match.group('ip')
        hour_key = match.group('hour')
        ip_dict[(ip_key,hour_key)] = ip_dict.get((ip_key,hour_key),0)+1


k = Counter(ip_dict)
high = k.most_common(3)
print('The top 3 ip addresses are: ', high )




