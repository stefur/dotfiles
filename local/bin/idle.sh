#!/bin/bash

status=$(pgrep -a swayidle)

if [ $# -eq 0 ]; then
 echo "Arguments required. Exiting."
 exit 1
fi

case "${1}" in
    toggle)
        if [[ $status =~ "timeout" ]]; then
            pkill swayidle
            swayidle -w	before-sleep "lock.sh" &
            pkill -RTMIN+7 waybar
        else
            pkill swayidle
            swayidle -w	timeout 300 "lock.sh" timeout 600 "wlopm --off '*'" timeout 900 "loginctl suspend" resume "wlopm --on '*'" before-sleep "lock.sh" &
            pkill -RTMIN+7 waybar
        fi
    ;;
    status)
        if [[ $status =~ "timeout" ]]; then
            echo "﯈"
        else
            echo ""
        fi
    ;;
    startup)
        swayidle -w	timeout 300 "lock.sh" timeout 600 "wlopm --off '*'" timeout 900 "loginctl suspend" resume "wlopm --on '*'" before-sleep "lock.sh" &
    ;;
esac