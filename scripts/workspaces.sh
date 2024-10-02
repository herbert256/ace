#/bin/sh

. ~/ace/env

cd /workspaces

mkdir -p /ace/log/eclipse

nohup /opt/mqsi/ace toolkit       -data /workspaces/ace < /dev/null > /ace/log/eclipse/ace.log 2>&1 &
nohup MQExplorer                  -data /workspaces/mq  < /dev/null > /ace/log/eclipse/mq.log  2>&1 &
nohup /opt/sdp/datastudio/eclipse -data /workspaces/db2 < /dev/null > /ace/log/eclipse/db2.log 2>&1 &