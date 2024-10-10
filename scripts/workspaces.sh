#/bin/sh

rm -Rf /workspaces/*

cd /workspaces

tar zxf ~/ace/archives/workspace.mq.tar.gz
tar zxf ~/ace/archives/workspace.ace.tar.gz
tar zxf ~/ace/archives/workspace.db2.tar.gz
tar zxf ~/ace/archives/workspace.eclipse.tar.gz

mkdir -p /ace/log/eclipse

#nohup MQExplorer                  -data /workspaces/mq       > /ace/log/eclipse/mq.log      2>&1 &
#nohup /opt/sdp/datastudio/eclipse -data /workspaces/db2      > /ace/log/eclipse/db2.log     2>&1 &

nohup /opt/mqsi/ace toolkit       -data /workspaces/ace      > /ace/log/eclipse/ace.log     2>&1 &
nohup /opt/eclipse/eclipse        -data /workspaces/eclipse  > /ace/log/eclipse/eclipse.log 2>&1 & 
