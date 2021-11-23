#!/bin/bash

LV_NAMES=(home var: srv tmp var--log)
M_POINT=(home var srv tmp var/log)

for i in ${!LV_NAMES[@]}
do
	UUID=$(blkid | grep ${LV_NAMES[$i]} | cut -d '"' -f 2)
	echo UUID=$UUID /${M_POINT[$i]} ext4 defaults 0 0 >> /etc/fstab
done

UUID=$(blkid | grep swap | cut -d '"' -f 2)
echo UUID=$UUID none swap sw 0 0  >> /etc/fstab


