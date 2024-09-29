#/bin/sh

. ~/ace/env

echo "PUBSUB - APP"   | /opt/mqm/samp/bin/amqspub Test/MQ_APP   APP
echo "PUBSUB - ADMIN" | /opt/mqm/samp/bin/amqspub Test/MQ_ADMIN ADMIN