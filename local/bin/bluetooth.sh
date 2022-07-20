#!/bin/sh
status=$(bluetoothctl show | awk '{ if ($1 == "Powered:") { print $2 } }')
if [ $status = "no" ]; then 
    bluetoothctl power on
else
    bluetoothctl power off
fi