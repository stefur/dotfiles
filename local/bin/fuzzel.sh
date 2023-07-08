#!/bin/sh
# <&0 redirects stdin (fd 0) to fuzzel's stdin
# This is leveraged by both pass.sh, emojis.sh & mount.sh
fuzzel -f firamononerdfont:size=12,notocoloremoji:size=12 --dpi-aware=no -T foot -w 42 -b C2C9AFFF -t 1d1d16FF -s B6AFC9FF -S 1d1d16FF -B 0 -r 10 -I $@ <&0