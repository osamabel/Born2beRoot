#!/bin/bash

LV_NAMES=(home var srv tmp var--log)

for i in ${LV_NAMES[@]}
do
	UUID=blkid | grep ${LV_NAMES[$i]} | cut -d '"' -f 2
	NAME=blkid | grep $UUID | cut -d ':' -f 1 | cut -c 22-
	echo $NAME ":" $UUID
done

