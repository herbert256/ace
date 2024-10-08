#/bin/sh

killall -s SIGKILL IntegrationServer

db2stop 

endmqm -z -i ESB
endmqm -z -i INT
endmqm -z -i EXT
endmqm -z -i ADM
endmqm -z -i APP

dltmqm ESB
dltmqm INT
dltmqm EXT
dltmqm ADM
dltmqm APP

sudo pkill -U mqm --signal SIGKILL
