#/bin/sh

. ~/ace/env

mosquitto_pub -h localhost -p 1883 -i ItsMe -t Test/TT_APP   -m 'TT - APP'
mosquitto_pub -h localhost -p 1884 -i ItsMe -t Test/TT_ADMIN -m 'TT - ADMIN'