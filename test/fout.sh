#/bin/sh

echo 'app fout'   | /opt/mqm/samp/bin/amqsput TST_FOUT APP
echo 'admin fout' | /opt/mqm/samp/bin/amqsput TST_FOUT ADMIN
