#!/bin/sh
# <&0 redirects stdin (fd 0) to fuzzel's stdin
# This is leveraged by both pass.sh, emojis.sh & mount.sh
fuzzel -f firacode:size=12,notocoloremoji:size=12 --dpi-aware=no -T foot -w 42 -b 161320FF -t D9E0EEFF -m C9CBFFFF -s 6E6C7EFF -S 161320FF -B 2 -r 0 -C C9CBFFFF -I $@ <&0