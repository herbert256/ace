#/bin/sh

killall -s SIGKILL IntegrationServer

db2stop 

endmqm -z -i QM
endmqm -z -i ADMIN
endmqm -z -i APP
sleep 1

dltmqm QM
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

rm -Rf /var/mqm/log/QM*
rm -Rf /var/mqm/sockets/QM*
rm -Rf /var/mqm/qmgrs/QM

