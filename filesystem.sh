#!/bin/bash

LV_NAMES=(home var srv tmp var--log)
LV_PATH=/dev/mapper/LVMGroup-

for i in ${!LV_NAMES[@]}
do
	mkfs.ext4 ${LV_PATH}${LV_NAMES[$i]}
done

swapoff ${LV_PATH}swap > /dev/null 2>&1
mkswap ${LV_PATH}swap
swapon ${LV_PATH}swap

