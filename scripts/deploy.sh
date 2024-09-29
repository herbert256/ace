#/bin/sh

. ~/ace/env

for bar in ~/ace/projects/BARfiles/*.bar
do

  base=$(basename $bar)  
  seq=${base:0:2}
  
  echo " "
  echo "mqsideploy -i localhost -p 76$seq -a $bar"
  echo " "

  sleep 2

  mqsideploy -i localhost -p 76$seq -a $bar

done

sleep 3