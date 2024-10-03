#/bin/sh

~/ace/scripts/stop.sh > /tmp/aceStop.log 2>&1

~/ace/scripts/ram.sh /ace

mkdir -p /ace/log/test
mkdir -p /ace/test/hello/input
mkdir -p /ace/test/hello/output

~/ace/scripts/db2.sh           > /ace/log/db2.txt           2>&1
~/ace/scripts/mq.sh            > /ace/log/mq.txt            2>&1
~/ace/scripts/ace.sh           > /ace/log/ace.txt           2>&1
~/ace/scripts/kafka.sh         > /ace/log/kafka.txt         2>&1
~/ace/scripts/workspaces.sh    > /ace/log/workspaces.txt    2>&1
~/ace/scripts/monitoring.sh    > /ace/log/monitoring.txt    2>&1
~/ace/scripts/statistics.sh    > /ace/log/statistics.txt    2>&1
~/ace/scripts/resourcestats.sh > /ace/log/resourcestats.txt 2>&1
~/ace/test/test.sh             > /ace/log/test.txt          2>&1
