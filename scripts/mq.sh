#/bin/sh

. ~/ace/env

echo 'AllQueueManagers:'              >  /var/mqm/mqs.ini
echo '   DefaultPrefix=/mq'           >> /var/mqm/mqs.ini
echo 'LogDefaults:'                   >> /var/mqm/mqs.ini
echo '   LogDefaultPath=/var/mqm/log' >> /var/mqm/mqs.ini

crtmqm -c "ACE - Administration" -lc -md /mq    -p 1415 -u ADMIN_DEAD ADMIN
crtmqm -c "ACE - Applications"   -lc -md /mq -q -p 1414 -u APP_DEAD   APP

strmqm ADMIN
strmqm APP

/opt/mqsi/server/sample/wmq/iib_createqueues.sh ADMIN herbert
/opt/mqsi/server/sample/wmq/iib_createqueues.sh APP   herbert

~/ace/scripts/mqtt.sh APP   1883
~/ace/scripts/mqtt.sh ADMIN 1884

echo "DEFINE QLOCAL(PUBSUB_ADMIN)" | runmqsc ADMIN
echo "DEFINE QLOCAL(PUBSUB_APP)"   | runmqsc APP

echo "DEFINE QLOCAL(TT_ADMIN)" | runmqsc ADMIN
echo "DEFINE QLOCAL(TT_APP)"   | runmqsc ADMIN

echo "DEFINE SUB(ALL) TOPICSTR('#') PSPROP (RFH2) DEST(PUBSUB_ADMIN)"  | runmqsc ADMIN
echo "DEFINE SUB(ALL) TOPICSTR('#') PSPROP (RFH2) DEST(PUBSUB_APP)"    | runmqsc APP

echo "DEFINE QLOCAL(APP_FAIL)"        | runmqsc ADMIN
echo "DEFINE QLOCAL(APP_DEAD)"        | runmqsc ADMIN

echo "DEFINE QLOCAL(ADMIN_FAIL)"      | runmqsc ADMIN
echo "DEFINE QLOCAL(ADMIN_DEAD)"      | runmqsc ADMIN
echo "DEFINE QLOCAL(ADMIN_TROUBLES)"  | runmqsc ADMIN

echo "DEFINE QLOCAL(TST_GOED_IN)"      | runmqsc ADMIN
echo "DEFINE QLOCAL(TST_GOED_OUT)"     | runmqsc ADMIN
echo "DEFINE QLOCAL(TST_FOUT_CATCH)"   | runmqsc ADMIN
echo "DEFINE QLOCAL(TST_FOUT_FAILURE)" | runmqsc ADMIN

echo "DEFINE QLOCAL(ADMIN_DEAD)"       | runmqsc ADMIN

echo "DEFINE QLOCAL(TST_GOED_IN)"      | runmqsc APP
echo "DEFINE QLOCAL(TST_GOED_OUT)"     | runmqsc APP
echo "DEFINE QLOCAL(TST_FOUT_CATCH)"   | runmqsc APP
echo "DEFINE QLOCAL(TST_FOUT_FAILURE)" | runmqsc APP

echo "DEFINE QLOCAL (APP_DEAD)  "      | runmqsc APP

echo "DEFINE QLOCAL(HELLO_CORR)"          | runmqsc APP
echo "DEFINE QLOCAL(HELLO)"               | runmqsc APP

echo "DEFINE QLOCAL(HELLO_MQ_IN)"         | runmqsc APP
echo "DEFINE QLOCAL(HELLO_MQ_OUT)"        | runmqsc APP

echo "DEFINE QLOCAL(HELLO_RESPONSE_HTTP)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_SOAP)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_FILE)" | runmqsc APP
echo "DEFINE QLOCAL(HELLO_RESPONSE_MQ)"   | runmqsc APP