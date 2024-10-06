#/bin/sh

cat ~/ace/test/hello/kafka.xml | /kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic helloRequest

nohup sleep 5 && kcat -C -b localhost:9092 -t helloResponse -o -1 -e > /ace/test/hello/kafka.xml &
