#!/bin/sh
name=$(iwctl adapter list | awk 'FNR == 5 { print $2 }')
status=$(iwctl adapter list | awk 'FNR == 5 { print $3 }')
if [ $status = "off" ]; then 
    iwctl adapter $name set-property Powered on
else
    iwctl adapter $name set-property Powered off
fi