#/bin/sh

nohup /kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic IIB02 --max-messages 1 < /dev/null > /ace/test/hello/kafka.xml 2>&1 &
sleep 2
cat ~/ace/test/hello/hello.xml | /kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic IIB01
