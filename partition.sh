#!/bin/bash

echo "Logic Volume Creation ..."
sleep 5
lvcreate.sh

echo "Formating With ext4 && swap ..."
sleep 5
filesystem.sh

echo "mounting ..."
sleep 5
mount.sh
