#!/bin/bash
clear
echo "Create by [ obelkah ]"
echo ""
echo ""

echo "####### REST VOLUME GROUP..."
sleep 2
source reset.sh
echo ""
echo ""

echo "#######  Logic Volume Creation ..."
sleep 2
source lvcreate.sh

echo ""
echo ""

echo "#######  Formating With ext4 && swap ..."
sleep 2
source filesystem.sh

echo ""
echo ""

echo "#######  mounting ..."
sleep 2
source mount.sh

echo ""
echo ""

echo "#######  Updatinr fstab ..."
sleep 2
source up_fstab.sh
echo "DONE"
