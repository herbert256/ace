#/bin/sh

rm -Rf /var/mqm/*

cd /var/mqm
tar zxf ~/ace/archives/var.mqm.tar.gz
sudo chown -R mqm:mqm /var/mqm

~/ace/scripts/mq/create.sh    > /ace/log/setup/mq/create.txt    2>&1
~/ace/scripts/mq/start.sh     > /ace/log/setup/mq/start.txt     2>&1
~/ace/scripts/mq/listeners.sh > /ace/log/setup/mq/listeners.txt 2>&1
~/ace/scripts/mq/cluster.sh   > /ace/log/setup/mq/cluster.txt   2>&1
~/ace/scripts/mq/events.sh    > /ace/log/setup/mq/events.txt    2>&1

runmqsc ESB < ~/ace/scripts/mq/ESB.mqsc > /ace/log/setup/mq/mq_ESB.txt 2>&1
runmqsc INT < ~/ace/scripts/mq/INT.mqsc > /ace/log/setup/mq/mq_INT.txt 2>&1
runmqsc EXT < ~/ace/scripts/mq/EXT.mqsc > /ace/log/setup/mq/mq_EXT.txt 2>&1
runmqsc ADM < ~/ace/scripts/mq/ADM.mqsc > /ace/log/setup/mq/mq_ADM.txt 2>&1
runmqsc APP < ~/ace/scripts/mq/APP.mqsc > /ace/log/setup/mq/mq_APP.txt 2>&1

/opt/mqsi/server/sample/wmq/iib_createqueues.sh ESB herbert > /ace/log/setup/mq/ace_ESB.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh INT herbert > /ace/log/setup/mq/ace_INT.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh EXT herbert > /ace/log/setup/mq/ace_EXT.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh ADM herbert > /ace/log/setup/mq/ace_ADM.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh APP herbert > /ace/log/setup/mq/ace_APP.txt 2>&1

echo "REFRESH CLUSTER(ESB) REPOS(YES)" | runmqsc ESB

~/ace/scripts/mq/test.sh > /ace/log/setup/mq/test.txt 2>&1
