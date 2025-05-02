#!/bin/sh

app_id="$1"
shift
cmd="$@"

window_id=$(niri msg -j windows | jq -r --arg app "$app_id" '.[] | select(.app_id==$app) | .id' | head -n 1)
focused_window=$(niri msg -j focused-window | jq -r '.app_id')

if [ -n "$window_id" ]; then
    if [ "$focused_window" = "$app_id" ]; then
        niri msg action focus-window-previous
    else
        niri msg action focus-window --id "$window_id"
    fi
else
    eval "$cmd &"
fi
