#!/bin/bash

# Get the current mode from mako
MODE=$(makoctl mode)

# Check the mode and toggle
if [ "$MODE" = "default" ]; then
    makoctl mode -s do-not-disturb > /dev/null 2>&1
    echo "{\"class\": \"dnd\", \"alt\": \"dnd\", \"tooltip\": \"\"}"
elif [ "$MODE" = "do-not-disturb" ]; then
    makoctl mode -s default > /dev/null 2>&1
    echo "{\"class\": \"default\", \"alt\": \"default\", \"tooltip\": \"\"}"
else
    echo "Unknown mode: $MODE"
fi
