#/bin/sh

echo "PUBSUB - APP"   | /opt/mqm/samp/bin/amqspub PubSub/APP   APP
echo "PUBSUB - ADMIN" | /opt/mqm/samp/bin/amqspub PubSub/ADMIN ADMIN