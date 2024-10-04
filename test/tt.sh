#/bin/sh

mosquitto_pub -h localhost -p 1883 -i ItsMe -t TT/APP   -m 'TT - APP'
mosquitto_pub -h localhost -p 1884 -i ItsMe -t TT/ADMIN -m 'TT - ADMIN'