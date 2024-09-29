#/bin/sh

~/ace/scripts/stop.sh

~/ace/ram.sh /ace
~/ace/ram.sh /var/mqsi
~/ace/ram.sh /mq
~/ace/ram.sh /workspaces

mkdir /ace/log

~/ace/scripts/db2.sh           > /ace/log/db2.txt           2>&1
~/ace/scripts/mq.sh            > /ace/log/mq.txt            2>&1
~/ace/scripts/ace.sh           > /ace/log/ace.txt           2>&1
~/ace/scripts/kafka.sh         > /ace/log/kafka.txt         2>&1
~/ace/scripts/deploy.sh        > /ace/log/deploy.txt        2>&1
~/ace/scripts/workspaces.sh    > /ace/log/workspaces.txt    2>&1
~/ace/scripts/monitoring.sh    > /ace/log/monitoring.txt    2>&1
~/ace/scripts/statistics.sh    > /ace/log/statistics.txt    2>&1
~/ace/scripts/resourcestats.sh > /ace/log/resourcestats.txt 2>&1
~/ace/test/test.sh             > /ace/log/test.txt          2>&1
