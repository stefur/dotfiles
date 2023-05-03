#!/bin/sh
# <&0 redirects stdin (fd 0) to fuzzel's stdin
# This is leveraged by both pass.sh, emojis.sh & mount.sh
fuzzel -f firamononerdfont:size=12,notocoloremoji:size=12 --dpi-aware=no -T foot -w 42 -b 16161DFF -t D9E0EEFF -m 9CABCAFF -s 54546DFF -S 16161DFF -B 2 -r 0 -C 9CABCAFF -I $@ <&0