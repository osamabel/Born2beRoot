#!/bin/bash

lv_names=(swap home var srv tmp var-log)
lv_size=(2.3G 5G 3G 3G 3G 4G)
vg=LVMGroup

for i in ${!lv_names[@]}
do
	lvcreate -Wy -L ${lv_size[$i]} -n ${lv_names[$i]} $vg
done
