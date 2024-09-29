#/bin/sh

sudo umount    $1 > /dev/null 2>&1
sudo umount -l $1 > /dev/null 2>&1
sudo rm -Rf    $1 > /dev/null 2>&1

sudo mkdir  $1
sudo chown herbert:herbert $1

rm -Rf             /dev/shm/ram$1
mkdir -p           /dev/shm/ram$1
sudo mount --bind  /dev/shm/ram$1 $1
chmod 1777         /dev/shm/ram$1