#/bin/sh

rm -Rf /var/mqsi/*

cd /var/mqsi
tar zxf ~/ace/archives/var.mqsi.tar.gz
sudo chown -R herbert:mqbrkrs /var/mqsi

FILES=~/ace/config/*.yaml

for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
  b=~/ace/projects/bars/$n.bar
  w=/ace/servers/$n
 
  mqsicreateworkdir $w

  cp $p $w/overrides/server.conf.yaml

  mqsibar -a $b -c -w $w

  mqsisetdbparms -w $w -n DB -u herbert -p boika

  nohup IntegrationServer --name $n --work-dir $w  < /dev/null > /$w/log/stdout.txt 2>$w/log/stderr.txt &

done