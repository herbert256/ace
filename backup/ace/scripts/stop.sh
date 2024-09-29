#/bin/sh

. ~/ace/env

killall -s SIGKILL IntegrationServer

endmqm -z -i ADMIN
endmqm -z -i APP

dltmqm ADMIN
dltmqm APP

db2stop