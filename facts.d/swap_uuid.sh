#!/bin/bash

swapdev=$(swapon | tail -n1 | cut -d' ' -f1)
for uuid in $(ls /dev/disk/by-uuid); do
    readlink -f /dev/disk/by-uuid/${uuid} | grep $swapdev >/dev/null && break
done
echo "swap_uuid=${uuid}"
