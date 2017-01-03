#!/bin/bash

swapdev=$(swapon | tail -n1 | cut -d' ' -f1)

for uuid in $(ls /dev/disk/by-uuid); do
    readlink -f /dev/disk/by-uuid/${uuid} | grep $swapdev >/dev/null && break
done

if [[ $swapdev == /dev/dm-* ]]; then
    for partition in $(find /dev/mapper -type l); do
        readlink -f $partition | grep $swapdev >/dev/null && break
    done
    swapdev=$partition
fi

echo "swap_device=${swapdev}"
echo "swap_uuid=${uuid}"
