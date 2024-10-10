#/bin/sh

echo '***' | /opt/mqm/samp/bin/amqsput ESB.FAIL ESB
echo '***' | /opt/mqm/samp/bin/amqsput ESB.FAIL INT
echo '***' | /opt/mqm/samp/bin/amqsput ESB.FAIL EXT
echo '***' | /opt/mqm/samp/bin/amqsput ESB.FAIL ADM

echo '***' | /opt/mqm/samp/bin/amqsput INT.FAIL ESB
echo '***' | /opt/mqm/samp/bin/amqsput INT.FAIL INT
echo '***' | /opt/mqm/samp/bin/amqsput INT.FAIL EXT
echo '***' | /opt/mqm/samp/bin/amqsput INT.FAIL ADM

echo '***' | /opt/mqm/samp/bin/amqsput EXT.FAIL ESB
echo '***' | /opt/mqm/samp/bin/amqsput EXT.FAIL INT
echo '***' | /opt/mqm/samp/bin/amqsput EXT.FAIL EXT
echo '***' | /opt/mqm/samp/bin/amqsput EXT.FAIL ADM

echo '***' | /opt/mqm/samp/bin/amqsput ADM.FAIL ESB
echo '***' | /opt/mqm/samp/bin/amqsput ADM.FAIL INT
echo '***' | /opt/mqm/samp/bin/amqsput ADM.FAIL EXT
echo '***' | /opt/mqm/samp/bin/amqsput ADM.FAIL ADM
