#/bin/sh

crtmqm -c "ESB - ESB" -lc -q -p 1414 -d ESB.TRANS -u ESB.DEAD ESB
crtmqm -c "ESB - INT" -lc    -p 1415 -d INT.TRANS -u INT.DEAD INT
crtmqm -c "ESB - EXT" -lc    -p 1416 -d EXT.TRANS -u EXT.DEAD EXT
crtmqm -c "ESB - ADM" -lc    -p 1417 -d ADM.TRANS -u ADM.DEAD ADM
crtmqm -c "APP"       -lc    -p 1419 -d APP.TRANS -u APP.DEAD APP
