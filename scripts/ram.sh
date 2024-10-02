#/bin/sh

sudo umount    $1 > /dev/null 2>&1
sudo umount -l $1 > /dev/null 2>&1

sudo rm -Rf $1 
sudo rm -Rf /dev/shm/ram$1

sudo mkdir -p $1
sudo mkdir -p /dev/shm/ram$1

sudo chown herbert:herbert $1
sudo chown herbert:herbert /dev/shm/ram$1

sudo mount --bind  /dev/shm/ram$1 $1
sudo chmod 1777    /dev/shm/ram$1