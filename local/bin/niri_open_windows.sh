#!/bin/bash
windows_json=$(niri msg -j windows)

# Extract each window id and title
windows=$(echo "$windows_json" | jq -r '.[] | "\(.id) \(.title)"')

# Use fuzzel
selected_window=$(printf '%s\n' "$windows" | fuzzel.sh -d 2> /dev/null | cut -d ' ' -f 1)
[ -n "$selected_window" ] || exit 1

# Focus the selected window
niri msg action focus-window --id ${selected_window}