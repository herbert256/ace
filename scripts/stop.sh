#/bin/sh

killall -s SIGKILL IntegrationServer

db2stop 

endmqm -z -i ADMIN
endmqm -z -i APP

dltmqm ADMIN
dltmqm APP

sudo pkill -U mqm --signal SIGKILL

rm -Rf /var/mqm/log/ADMIN*
rm -Rf /var/mqm/sockets/ADMIN*
rm -Rf /var/mqm/qmgrs/ADMIN*

rm -Rf /var/mqm/log/APP*
rm -Rf /var/mqm/sockets/APP*
rm -Rf /var/mqm/qmgrs/APP*

