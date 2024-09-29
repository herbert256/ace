#/bin/sh

. ~/ace/env

killall -s SIGKILL IntegrationServer

db2stop 

endmqm -z -i ADMIN
endmqm -z -i APP
sleep 1

dltmqm ADMIN
dltmqm APP
sleep 1

sudo pkill -U mqm --signal SIGKILL
sleep 1

rm -Rf /var/mqm/log/ADMIN*
rm -Rf /var/mqm/sockets/ADMIN*
rm -Rf /var/mqm/qmgrs/ADMIN*

rm -Rf /var/mqm/log/APP*
rm -Rf /var/mqm/sockets/APP*
rm -Rf /var/mqm/qmgrs/APP*

