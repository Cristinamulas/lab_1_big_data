#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Sep 29 17:17:04 2019

@author: cristinamulas
"""

import sys
import re
from collections import Counter

initial_time = input('please enter 00:')
final_time= input('please enter 01:')
ip_dict ={}
pat = re.compile('(?P<ip>\d+\.\d+\.\d+\.\d+).*?(?P<hour>(?<=:)\d\d)')

for line in sys.stdin:
    for i in range(int(initial_time) ,int(final_time)+1):
        match = pat.search(line)
        if match:
            ip_key = match.group('ip')
            hour_key = match.group('hour')
            if i == int(hour_key):
                ip_dict[(ip_key,hour_key)] = ip_dict.get((ip_key,hour_key),0)+1
                   
                    
    if i != hour_key:
        print('Sorry this time is not correct')
    
   
k = Counter(ip_dict)
high = k.most_common(3)
print('The top 3 ip addresses are: ', high )