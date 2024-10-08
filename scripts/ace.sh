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
 
  mqsicreateworkdir $w > /ace/log/setup/ace/create_$n.txt 2>&1

  cp $p $w/overrides/server.conf.yaml

  mqsibar -a $b -c -w $w > /ace/log/setup/ace/deploy_$n.txt 2>&1

  mqsisetdbparms -w $w -n DB -u herbert -p boika > /ace/log/setup/ace/dbparms_$n.txt 2>&1

  nohup IntegrationServer --name $n --work-dir $w   > /$w/log/stdout.txt 2>$w/log/stderr.txt &

done