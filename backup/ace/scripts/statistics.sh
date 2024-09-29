#/bin/sh

. ~/ace/env

FILES=~/ace/config/*.yaml
for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
  b=~/ace/projects/BARfiles/$n.bar
  w=/ace/servers/$n
 
  mqsichangeflowstats -i localhost -p 76$s --all-applications --all-flows  --all-libraries \
  --archive --control active --output-format xml,json,csv 

done