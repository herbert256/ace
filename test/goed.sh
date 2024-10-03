#/bin/sh

echo 'app goed'   | /opt/mqm/samp/bin/amqsput TST_GOED_IN  APP
echo 'admin goed' | /opt/mqm/samp/bin/amqsput TST_GOED_IN  ADMIN
