#!/bin/bash
device_name=$(lsblk -o NAME,SIZE,MODEL,MOUNTPOINT -l | tail -n +2 | tr -s ' ' | fuzzel.sh -d 2> /dev/null | cut -d ' ' -f 1)
[ -n "${device_name}" ] || exit 1
mount_point="$HOME/mnt/${device_name}"
if [ -d "$mount_point" ]; then
    pkexec umount $mount_point || exit 1
    if [ $(ls $mount_point) ]; then
        notify-send "Warning! ${mount_point} not empty"
    else
        rm -rf $mount_point
        notify-send "Unmounted ${mount_point}"
    fi
else
    mkdir -p ${mount_point} || exit 1
    pkexec mount /dev/${device_name} ${mount_point} || exit 1
    notify-send "Mounting /dev/${device_name} to ${mount_point}"
fi
