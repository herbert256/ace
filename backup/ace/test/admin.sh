#/bin/sh

. ~/ace/env

echo 'admin goed'          | /opt/mqm/samp/bin/amqsput TST_GOED_IN      ADMIN
echo 'admin fout catch'    | /opt/mqm/samp/bin/amqsput TST_FOUT_CATCH   ADMIN
echo 'admin fout failure'  | /opt/mqm/samp/bin/amqsput TST_FOUT_FAILURE ADMIN




