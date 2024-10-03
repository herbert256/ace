#/bin/sh

rm ~/ace/archives/workspace.ace.tar.gz
rm ~/ace/archives/workspace.mq.tar.gz
rm ~/ace/archives/workspace.db2.tar.gz
rm ~/ace/archives/workspace.eclipse.tar.gz

cd /workspaces
tar zcf ~/ace/archives/workspace.ace.tar.gz ace
tar zcf ~/ace/archives/workspace.mq.tar.gz mq
tar zcf ~/ace/archives/workspace.db2.tar.gz db2
tar zcf ~/ace/archives/workspace.eclipse.tar.gz eclipse

