#/bin/sh

cd ~/asleep 3
killall -s SIGKILL IntegrationServer
sleep 1

FILES=~/ace/config/*.yaml
for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
 
  cp $p /ace/servers/$n/overrides/server.conf.yaml

  rm -rf /ace/servers/$n/log
  mkdir  /ace/servers/$n/log

  nohup IntegrationServer --name $n --work-dir /ace/servers/$n < /dev/null > /ace/servers/$n/log/out.txt 2>/ace/servers/$n/log/err.txt &
  sleep 3

done