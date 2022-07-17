#!/bin/sh

if pgrep "swayidle" > /dev/null
then
    pkill swayidle
    pkill -RTMIN+7 waybar
else
    swayidle -w	timeout 300 "lock.sh" timeout 600 "wlopm --off '*'" timeout 900 "loginctl suspend" resume "wlopm --on '*'" before-sleep "lock.sh" &
    pkill -RTMIN+7 waybar
fi
