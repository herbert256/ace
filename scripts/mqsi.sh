#/bin/sh

~/ace/scripts/ram.sh /var/mqsi

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

cd /var/mqsi

tar zcf ~/ace/archives/var.mqsi.tar.gz *

