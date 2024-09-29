#/bin/sh

cd /kafka

tar -xzf ~/Downloads/kafka_2.13-3.8.0.tgz
mv kafka_2.13-3.8.0/* .
rmdir kafka_2.13-3.8.0

mkdir /kafka/logs

nohup /kafka/bin/zookeeper-server-start.sh config/zookeeper.properties < /dev/null > logs/kafka_zookeeper.txt 2>&1 &
sleep 3
nohup /kafka/bin/kafka-server-start.sh     config/server.properties    < /dev/null > logs/kafka_server.txt    2>&1 &
sleep 3

bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic IIB01
bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic IIB02