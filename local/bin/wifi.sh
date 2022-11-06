#!/bin/sh
status=$(connmanctl state | awk '{ if ($1 == "State") { print $3 } }')
if [ $status = "idle" ]; then 
    connmanctl enable wifi
else
    connmanctl disable wifi
fi