#/bin/sh

rm -Rf /var/mqm/*

cd /var/mqm
tar zxf ~/ace/archives/var.mqm.tar.gz
sudo chown -R mqm:mqm /var/mqm
sudo chown -R mqttUser:mqm /var/mqm/mqttUser

crtmqm -c "ACE - Administration" -lc    -p 1415 -u DEAD ADMIN
crtmqm -c "ACE - Applications"   -lc -q -p 1414 -u DEAD   APP

strmqm ADMIN
strmqm APP

/opt/mqsi/server/sample/wmq/iib_createqueues.sh ADMIN herbert
/opt/mqsi/server/sample/wmq/iib_createqueues.sh APP   herbert

~/ace/scripts/mqtt.sh APP   1883

echo "DEFINE CHANNEL(SYSTEM.ADMIN.SVRCONN) CHLTYPE(SVRCONN) TRPTYPE(TCP)" | runmqsc APP
echo "SET CHLAUTH(SYSTEM.ADMIN.SVRCONN) TYPE(ADDRESSMAP) ADDRESS(127.0.0.1) MCAUSER('herbert')" | runmqsc APP
echo "ALTER QMGR CONNAUTH('')" | runmqsc APP
echo "REFRESH SECURITY TYPE(CONNAUTH)" | runmqsc APP

echo "DEFINE CHANNEL(SYSTEM.ADMIN.SVRCONN) CHLTYPE(SVRCONN) TRPTYPE(TCP)" | runmqsc ADMIN
echo "SET CHLAUTH(SYSTEM.ADMIN.SVRCONN) TYPE(ADDRESSMAP) ADDRESS(127.0.0.1) MCAUSER('herbert')" | runmqsc ADMIN
echo "ALTER QMGR CONNAUTH('')" | runmqsc ADMIN
echo "REFRESH SECURITY TYPE(CONNAUTH)" | runmqsc ADMIN

echo "DEFINE QLOCAL(EVENTS)"   | runmqsc APP

echo "DEFINE SUB(ALL) TOPICSTR('#') PSPROP (RFH2) DEST(EVENTS)"    | runmqsc APP

echo "DEFINE QLOCAL(DEAD)"            | runmqsc ADMIN
echo "DEFINE QLOCAL(DEAD)"            | runmqsc APP

echo "DEFINE QLOCAL(FAIL)"            | runmqsc ADMIN
echo "DEFINE QLOCAL(FAIL)"            | runmqsc APP

echo "DEFINE QLOCAL(TROUBLES)"            | runmqsc ADMIN

echo "DEFINE QLOCAL(TST_OK_IN)"      | runmqsc ADMIN
echo "DEFINE QLOCAL(TST_OK_OUT)"     | runmqsc ADMIN
echo "DEFINE QLOCAL(TST_ERROR)"         | runmqsc ADMIN


echo "DEFINE QLOCAL(TST_OK_IN)"      | runmqsc APP
echo "DEFINE QLOCAL(TST_OK_OUT)"     | runmqsc APP
echo "DEFINE QLOCAL(TST_ERROR)"         | runmqsc APP

echo "DEFINE QLOCAL(HELLO_CORR)"          | runmqsc APP
echo "DEFINE QLOCAL(HELLO)"               | runmqsc APP

echo "DEFINE QLOCAL(HELLO_MQ_IN)"         | runmqsc APP
echo "DEFINE QLOCAL(HELLO_MQ_OUT)"        | runmqsc APP

echo "DEFINE QLOCAL(HELLO_RESPONSE_HTTP)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_SOAP)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_FILE)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_MQ)"   | runmqsc APP