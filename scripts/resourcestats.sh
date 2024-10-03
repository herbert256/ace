#/bin/sh

FILES=~/ace/config/*.yaml
for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
 
  mqsichangeresourcestats -i localhost -p 76$s --control active 

done