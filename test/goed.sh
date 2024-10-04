#/bin/sh

echo 'app goed'   | /opt/mqm/samp/bin/amqsput TST_OK_IN APP
echo 'admin goed' | /opt/mqm/samp/bin/amqsput TST_OK_IN ADMIN
