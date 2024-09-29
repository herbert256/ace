#/bin/sh

. ~/ace/env

~/ace/ram.sh /workspaces

cd /workspaces

tar zxf ~/ace/workspaces/ace.tar.gz
tar zxf ~/ace/workspaces/mq.tar.gz
tar zxf ~/ace/workspaces/db2.tar.gz

mkdir -p /ace/log/eclipse

nohup /opt/mqsi/ace toolkit       -data /workspaces/ace < /dev/null > /ace/log/eclipse/ace.log 2>&1 &
nohup MQExplorer                  -data /workspaces/mq  < /dev/null > /ace/log/eclipse/mq.log  2>&1 &
nohup /opt/sdp/datastudio/eclipse -data /workspaces/db2 < /dev/null > /ace/log/eclipse/db2.log 2>&1 &