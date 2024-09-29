#/bin/sh

. ~/ace/env

sudo mkdir -p /var/mqm/mqttUser
sudo useradd mqttUser -p mqm -g mqm -d /var/mqm/mqttUser
sudo chown -R mqttUser:mqm /var/mqm/mqttUser

echo "DEFINE QLOCAL('SYSTEM.MQTT.TRANSMIT.QUEUE') USAGE(XMITQ) MAXDEPTH(100000)" | runmqsc $1
echo "ALTER QMGR DEFXMITQ('SYSTEM.MQTT.TRANSMIT.QUEUE')" | runmqsc $1

setmqaut -m $1 -t topic -n SYSTEM.BASE.TOPIC          -p mqttUser -all +pub +sub
setmqaut -m $1 -t q     -n SYSTEM.MQTT.TRANSMIT.QUEUE -p mqttUser -all +put

setmqaut -m $1 -t topic -n SYSTEM.BASE.TOPIC          -p herbert -all +pub +sub
setmqaut -m $1 -t q     -n SYSTEM.MQTT.TRANSMIT.QUEUE -p herbert -all +put

cat /opt/mqm/mqxr/samples/installMQXRService_unix.mqsc | runmqsc $1

echo "START SERVICE(SYSTEM.MQXR.SERVICE)" | runmqsc $1

echo "DEFINE CHANNEL(MQTT) CHLTYPE(MQTT) PORT($2) MCAUSER('herbert')"  | runmqsc $1
