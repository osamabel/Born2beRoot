#!/bin/bash

swapoff /dev/mapper/LVMGroup-swap > /dev/null 2>&1
umount /dev/mapper/LVMGroup-home > /dev/null  2>&1
umount /dev/mapper/LVMGroup-var > /dev/null  2>&1
umount /dev/mapper/LVMGroup-var--log > /dev/null  2>&1
umount /dev/mapper/LVMGroup-tmp > /dev/null  2>&1
umount /dev/mapper/LVMGroup-srv > /dev/null  2>&1
umount /dev/mapper/LVMGroup-var > /dev/null  2>&1
lvremove --yes LVMGroup
