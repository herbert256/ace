#/bin/sh

echo 'Test Error ESB' | /opt/mqm/samp/bin/amqsput ESB.TEST.ERROR ESB
echo 'Test Error ADM' | /opt/mqm/samp/bin/amqsput ADM.TEST.ERROR ADM
