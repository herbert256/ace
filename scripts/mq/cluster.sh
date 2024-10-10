#/bin/sh

echo "ALTER QMGR REPOS(ESB)" | runmqsc ESB
echo "ALTER QMGR REPOS(ESB)" | runmqsc INT
echo "ALTER QMGR REPOS(ESB)" | runmqsc EXT
echo "ALTER QMGR REPOS(ESB)" | runmqsc ADM

echo "DEFINE CHANNEL(ESB.CLUSTER) CHLTYPE(CLUSRCVR) CONNAME('127.0.0.1(1414)') CLUSTER(ESB)" | runmqsc ESB
echo "DEFINE CHANNEL(INT.CLUSTER) CHLTYPE(CLUSRCVR) CONNAME('127.0.0.1(1415)') CLUSTER(ESB)" | runmqsc INT
echo "DEFINE CHANNEL(EXT.CLUSTER) CHLTYPE(CLUSRCVR) CONNAME('127.0.0.1(1416)') CLUSTER(ESB)" | runmqsc EXT
echo "DEFINE CHANNEL(ADM.CLUSTER) CHLTYPE(CLUSRCVR) CONNAME('127.0.0.1(1417)') CLUSTER(ESB)" | runmqsc ADM

echo "DEFINE CHANNEL(INT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1415)') CLUSTER(ESB)" | runmqsc ESB
echo "DEFINE CHANNEL(EXT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1416)') CLUSTER(ESB)" | runmqsc ESB
echo "DEFINE CHANNEL(ADM.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1417)') CLUSTER(ESB)" | runmqsc ESB

echo "DEFINE CHANNEL(ESB.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1414)') CLUSTER(ESB)" | runmqsc INT
echo "DEFINE CHANNEL(EXT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1416)') CLUSTER(ESB)" | runmqsc INT
echo "DEFINE CHANNEL(ADM.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1417)') CLUSTER(ESB)" | runmqsc INT

echo "DEFINE CHANNEL(ESB.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1414)') CLUSTER(ESB)" | runmqsc EXT
echo "DEFINE CHANNEL(INT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1415)') CLUSTER(ESB)" | runmqsc EXT
echo "DEFINE CHANNEL(ADM.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1417)') CLUSTER(ESB)" | runmqsc EXT

echo "DEFINE CHANNEL(ESB.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1414)') CLUSTER(ESB)" | runmqsc ADM
echo "DEFINE CHANNEL(INT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1415)') CLUSTER(ESB)" | runmqsc ADM
echo "DEFINE CHANNEL(EXT.CLUSTER)  CHLTYPE(CLUSSDR)  CONNAME('127.0.0.1(1416)') CLUSTER(ESB)" | runmqsc ADM
