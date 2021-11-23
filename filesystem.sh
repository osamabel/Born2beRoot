#!/bin/bash

lv_names=(home var srv tmp var--log)
lv_path=/dev/mapper/LVMGroup-

for i in ${!lv_names[@]}
do
	mkfs.ext4 ${lv_path}${lv_name[$i]}
done

mkswap ${lv_path}swap
swapon ${lv_path}swap

