#!/bin/sh
cat workers | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
        ssh root@$line -n "rm -rf /lab_1_big_data/ && mkdir /lab_1_big_data/"
        echo "Copy data to $line"
        scp  /lab_1_big_data/setup.py root@$line:/lab_1_big_data/ && scp /lab_1_big_data/manager root@$line:/lab_1_big_data/ && scp /lab_1_big_data/workers root@$line:/lab_1_big_data/
        echo "Setup $line"
        ssh root@$line -n "cd /lab_1_big_data/ && python3 setup.py && ntpdate time.nist.gov"
        echo "Finished config node $line"
    fi
done
