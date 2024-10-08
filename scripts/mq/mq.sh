#/bin/sh

rm -Rf /var/mqm/*

cd /var/mqm
tar zxf ~/ace/archives/var.mqm.tar.gz
sudo chown -R mqm:mqm /var/mqm
sudo chown -R mqttUser:mqm /var/mqm/mqttUser

crtmqm -c "ESB - ESB" -lc -q -p 1414 -d ESB.TRANS -u ESB.DEAD ESB
crtmqm -c "ESB - INT" -lc    -p 1415 -d INT.TRANS -u INT.DEAD INT
crtmqm -c "ESB - EXT" -lc    -p 1416 -d EXT.TRANS -u EXT.DEAD EXT
crtmqm -c "ESB - ADM" -lc    -p 1417 -d ADM.TRANS -u ADM.DEAD ADM
crtmqm -c "APP"       -lc    -p 1418 -d APP.TRANS -u APP.DEAD APP

strmqm ESB
strmqm INT
strmqm EXT
strmqm ADM
strmqm APP

/opt/mqsi/server/sample/wmq/iib_createqueues.sh ESB herbert > /ace/log/setup/mq/ace_ESB.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh INT herbert > /ace/log/setup/mq/ace_INT.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh EXT herbert > /ace/log/setup/mq/ace_EXT.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh ADM herbert > /ace/log/setup/mq/ace_ADM.txt 2>&1
/opt/mqsi/server/sample/wmq/iib_createqueues.sh APP herbert > /ace/log/setup/mq/ace_APP.txt 2>&1

runmqsc ESB < ~/ace/scripts/ESB.mqsc > /ace/log/setup/mq/ESB.txt 2>&1
runmqsc INT < ~/ace/scripts/INT.mqsc > /ace/log/setup/mq/INT.txt 2>&1
runmqsc EXT < ~/ace/scripts/EXT.mqsc > /ace/log/setup/mq/EXT.txt 2>&1
runmqsc ADM < ~/ace/scripts/ADM.mqsc > /ace/log/setup/mq/ADM.txt 2>&1
runmqsc APP < ~/ace/scripts/APP.mqsc > /ace/log/setup/mq/APP.txt 2>&1

runmqsc ESB < ~/ace/scripts/cluster.mqsc > /ace/log/setup/mq/cluser.txt 2>&1