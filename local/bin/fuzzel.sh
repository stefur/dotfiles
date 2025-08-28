#!/bin/sh
# <&0 redirects stdin (fd 0) to fuzzel's stdin
# This is leveraged by both pass.sh, emojis.sh & mount.sh

# Settings for fuzzel
SETTINGS="-f firacoderetina:size=12,notocoloremoji:size=12 \
             --dpi-aware=no -T foot -w 42 -b dadadaff -t 2f2f2fff --prompt-color 2f2f2fff \
             -s 769675ff -S 2f2f2fff -B 0 -r 10 -I --selection-radius=4"

# Check if stdin is not a terminal (input is piped)
if [ ! -t 0 ]; then
    # Read from stdin (input is piped)
    fuzzel $SETTINGS "$@" <&0
else
    # No stdin redirection; run normally (interactive input)
    fuzzel $SETTINGS "$@"
fi