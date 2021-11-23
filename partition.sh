#!/bin/bash
clear

echo "Create by [ obelkah ]"

echo "#######  Logic Volume Creation ..."
source sleep 2
lvcreate.sh
clear


echo "#######  Formating With ext4 && swap ..."
sleep 2
source filesystem.sh
clear


echo "#######  mounting ..."
sleep 2
source mount.sh
clear

echo "#######  Updatinr fstab ..."
sleep 2
source up_fstab.sh
echo "DONE"
