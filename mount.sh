#!/bin/bash

lv_names=(home var srv tmp var--log)
lv_path=/dev/mapper/LVMGroup-
moint_point=(home var srv tmp var/log)

mkdir -p /var/log

for i in ${!lv_names[@]}
do
mount /dev/mapper/LVMGroup-home /home
	mount ${lv_path}${lv_names[$i]} /${moint_point[$i]}
done
