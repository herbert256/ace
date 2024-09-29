#/bin/sh

. ~/ace/env

echo 'app fout' | /opt/mqm/samp/bin/amqsput TST_FOUT_CATCH   APP
echo 'app fout' | /opt/mqm/samp/bin/amqsput TST_FOUT_FAILURE APP
