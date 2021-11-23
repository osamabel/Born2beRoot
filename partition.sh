#!/bin/bash
clear

echo "Logic Volume Creation ..."
source sleep 5
lvcreate.sh

echo "Formating With ext4 && swap ..."
sleep 5
source filesystem.sh

echo "mounting ..."
sleep 5
source mount.sh

echo "Updatinr fstab ..."
sleep 5
source up_fstab.sh
