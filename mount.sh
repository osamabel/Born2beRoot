#!/bin/bash

lv_names=(home var srv tmp var--log)
lv_path=/dev/mapper/LVMGroup-
moint_point=(home var srv tmp var/log)


for i in ${!lv_names[@]}
do
	if [ ${lv_names[$i]} = "var--log" ]; then
		mkdir -p /var/log
	fi
	mount ${lv_path}${lv_names[$i]} /${moint_point[$i]}
done
