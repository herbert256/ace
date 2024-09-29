#/bin/sh

. ~/ace/env

cd ~/ace

/opt/mqsi/ace make registry global accept license silently

mkdir -p /var/mqsi/odbc

echo '[ODBC Data Sources]'                      >  /var/mqsi/odbc/odbc.ini
echo 'DB=IBM DB2 ODBC Driver'                   >> /var/mqsi/odbc/odbc.ini
echo ''                                         >> /var/mqsi/odbc/odbc.ini
echo '[DB]'                                     >> /var/mqsi/odbc/odbc.ini
echo 'DRIVER=/opt/db2/lib64/libdb2o.so'         >> /var/mqsi/odbc/odbc.ini
echo 'Description=IBM DB2 ODBC Database'        >> /var/mqsi/odbc/odbc.ini
echo 'Database=DB'                              >> /var/mqsi/odbc/odbc.ini
echo ''                                         >> /var/mqsi/odbc/odbc.ini
echo '[ODBC]'                                   >> /var/mqsi/odbc/odbc.ini
echo 'InstallDir=/opt/mqsi/server/ODBC/drivers' >> /var/mqsi/odbc/odbc.ini
echo 'UseCursorLib=0'                           >> /var/mqsi/odbc/odbc.ini
echo 'IANAAppCodePage=4'                        >> /var/mqsi/odbc/odbc.ini
echo 'UNICODE=UTF-8'                            >> /var/mqsi/odbc/odbc.ini

echo '[ODBC]'                                   >  /var/mqsi/odbc/odbcinst.ini
echo 'Trace=no'                                 >> /var/mqsi/odbc/odbcinst.ini
echo 'TraceFile=/var/mqsi/trace/db2_trace.txt'  >> /var/mqsi/odbc/odbcinst.ini
echo 'Threading=2'                              >> /var/mqsi/odbc/odbcinst.ini

chmod 755 /var/mqsi/odbc
chmod 664 /var/mqsi/odbc/odbc.ini
chmod 755 /var/mqsi/odbc/odbcinst.ini

mkdir -p /ace/test/hello/input
mkdir -p /ace/file/input
mkdir -p /ace/file/output
mkdir -p /ace/log/test
mkdir -p /ace/log/hello
mkdir -p /ace/servers

FILES=~/ace/config/*.yaml
for p in $FILES
do

  f=$(basename $p)  
  s=${f:0:2}
  n="${f%.*}"
  b=~/ace/projects/BARfiles/$n.bar
  w=/ace/servers/$n
 
  mqsicreateworkdir $w

  cp $p $w/overrides/server.conf.yaml

  mqsibar -a $b -c -w $w

  mqsisetdbparms -w $w -n DB -u herbert -p ww

  nohup IntegrationServer --name $n --work-dir $w  < /dev/null > /$w/log/out.txt 2>$w/log/err.txt &

done