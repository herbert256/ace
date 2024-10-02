#/bin/sh

~/ace/scripts/stop.sh > /tmp/aceSto.log 2>&1

~/ace/scripts/ram.sh /ace
~/ace/scripts/ram.sh /var/mqm
~/ace/scripts/ram.sh /var/mqsi
~/ace/scripts/ram.sh /workspaces
~/ace/scripts/ram.sh /kafka

cd /workspaces
tar zxf ~/ace/archives/workspace.ace.tar.gz
tar zxf ~/ace/archives/workspace.mq.tar.gz
tar zxf ~/ace/archives/workspace.db2.tar.gz

cd /var/mqm
tar zxf ~/ace/archives/var.mqm.tar.gz
sudo chown -R mqm:mqm /var/mqm

#cd /var/mqsi
#tar zxf ~/ace/archives/var.mqsi.tar.gz
#sudo chown -R herbert:mqbrkrs /var/mqsi

mkdir /ace/log

~/ace/scripts/db2.sh           > /ace/log/db2.txt           2>&1
~/ace/scripts/mq.sh            > /ace/log/mq.txt            2>&1
~/ace/scripts/ace.sh           > /ace/log/ace.txt           2>&1
~/ace/scripts/kafka.sh         > /ace/log/kafka.txt         2>&1
#~/ace/scripts/deploy.sh        > /ace/log/deploy.txt        2>&1
~/ace/scripts/workspaces.sh    > /ace/log/workspaces.txt    2>&1
~/ace/scripts/monitoring.sh    > /ace/log/monitoring.txt    2>&1
~/ace/scripts/statistics.sh    > /ace/log/statistics.txt    2>&1
~/ace/scripts/resourcestats.sh > /ace/log/resourcestats.txt 2>&1
~/ace/test/test.sh             > /ace/log/test.txt          2>&1
