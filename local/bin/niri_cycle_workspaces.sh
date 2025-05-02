#!/bin/bash
# Usage: script.sh [up|down]
direction="$1"

focused_output_json=$(niri msg -j focused-output)

output_name=$(echo "$focused_output_json" | jq -r '.name')
[ -n "$output_name" ] || { echo "Could not determine focused output"; exit 1; }

workspaces=$(niri msg -j workspaces)

current_workspace=$(echo "$workspaces" | jq -r --arg output "$output_name" 'map(select(.output == $output and .is_active == true)) | .[0]')
current_idx=$(echo "$current_workspace" | jq -r '.idx')
if [ -z "$current_idx" ] || [ "$current_idx" = "null" ]; then
    echo "No active workspace found for output $output_name"
    exit 1
fi

max_idx=$(echo "$workspaces" | jq -r --arg output "$output_name" 'map(select(.output == $output)) | max_by(.idx) | .idx')
if [ -z "$max_idx" ] || [ "$max_idx" = "null" ]; then
    echo "Could not determine the maximum workspace index for output $output_name"
    exit 1
fi

if [ "$direction" = "down" ]; then
    # If current is the highest, wrap to 1
    if [ "$current_idx" -eq "$max_idx" ]; then
        new_idx=1
    else
        new_idx=$((current_idx + 1))
    fi
elif [ "$direction" = "up" ]; then
    # If current is 1, wrap to the maximum
    if [ "$current_idx" -eq 1 ]; then
        new_idx=$max_idx
    else
        new_idx=$((current_idx - 1))
    fi
else
    echo "Invalid direction: use 'up' or 'down'"
    exit 1
fi

niri msg action focus-workspace "$new_idx"
