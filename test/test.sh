#/bin/sh

nohup ~/ace/test/ok.sh          < /dev/null > /ace/log/test/ok.txt   2>&1 &
nohup ~/ace/test/error.sh       < /dev/null > /ace/log/test/error.txt   2>&1 &
nohup ~/ace/test/pubsub.sh      < /dev/null > /ace/log/test/pubsub.txt 2>&1 &
nohup ~/ace/test/tt.sh          < /dev/null > /ace/log/test/tt.txt     2>&1 &

nohup ~/ace/test/hello/http.sh  < /dev/null > /ace/log/hello/http.txt  2>&1 &
nohup ~/ace/test/hello/soap.sh  < /dev/null > /ace/log/hello/soap.txt  2>&1 &
nohup ~/ace/test/hello/file.sh  < /dev/null > /ace/log/hello/file.txt  2>&1 &
nohup ~/ace/test/hello/mq.sh    < /dev/null > /ace/log/hello/mq.txt    2>&1 &
nohup ~/ace/test/hello/kafka.sh < /dev/null > /ace/log/hello/kafka.txt 2>&1 &