#/bin/sh

~/ace/scripts/stop.sh > /tmp/aceStop.log 2>&1

~/ace/scripts/ram.sh /ace

mkdir -p /ace/log
mkdir -p /ace/log/test
mkdir -p /ace/log/hello
mkdir -p /ace/log/setup
mkdir -p /ace/test/hello/input
mkdir -p /ace/test/hello/output

~/ace/scripts/db2.sh           > /ace/log/setup/db2.txt           2>&1
~/ace/scripts/mq.sh            > /ace/log/setup/mq.txt            2>&1
~/ace/scripts/ace.sh           > /ace/log/setup/ace.txt           2>&1
~/ace/scripts/kafka.sh         > /ace/log/setup/kafka.txt         2>&1
~/ace/scripts/workspaces.sh    > /ace/log/setup/workspaces.txt    2>&1
~/ace/scripts/monitoring.sh    > /ace/log/setup/monitoring.txt    2>&1
~/ace/scripts/statistics.sh    > /ace/log/setup/statistics.txt    2>&1
~/ace/scripts/resourcestats.sh > /ace/log/setup/resourcestats.txt 2>&1
~/ace/test/test.sh             > /ace/log/setup/test.txt          2>&1
