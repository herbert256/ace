#/bin/sh

rm -Rf /tmp/ace > /dev/null 2>&1

rm -Rf /ace/build

mkdir /ace/build
cp -R ~/ace/projects/* /ace/build