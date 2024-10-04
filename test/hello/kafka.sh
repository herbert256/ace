#/bin/sh

cat ~/ace/test/hello/hello.xml | /kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic IIB01
