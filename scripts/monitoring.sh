#/bin/sh

FILES=~/ace/config/*.yaml
for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
 
  mqsichangeflowmonitoring -i localhost -p 76$s -c active --all-applications --all-flows --all-libraries


done