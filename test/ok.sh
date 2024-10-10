#/bin/sh

echo 'Test OK ESB' | /opt/mqm/samp/bin/amqsput ESB.TEST.OK.IN ESB
echo 'Test OK ADM' | /opt/mqm/samp/bin/amqsput ADM.TEST.OK.IN ADM
