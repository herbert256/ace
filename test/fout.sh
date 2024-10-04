#/bin/sh

echo 'app fout'   | /opt/mqm/samp/bin/amqsput TST_ERROR APP
echo 'admin fout' | /opt/mqm/samp/bin/amqsput TST_ERROR ADMIN
