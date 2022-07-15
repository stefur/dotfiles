#!/bin/sh

# Get the current background image
bg=$(pgrep -a swaybg | awk '{print $6}')

# Lock the screen
swaylock -f -i $bg -l
