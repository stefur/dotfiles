#!/bin/sh
[ "$(cat /sys/class/power_supply/BAT0/status)" != Discharging -o "$(cat /sys/class/power_supply/BAT0/capacity)" -gt 5 ] || zzz
