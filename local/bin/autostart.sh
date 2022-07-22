#!/bin/sh

# Set the brightness since it defaults to 100% on boot
brightnessctl set 20%

# Pick a random wallpaper
file=$(ls ~/wallpapers | shuf -n 1)
swaybg -m fill -i ~/wallpapers/$file &

# Start the bar...
waybar &

# And my Spotify listener :)
lystra &

# And then syncthing to keep files all up to date
syncthing &

# Pipewire for audio
pipewire &
pipewire-pulse &

# Notifications daemon
mako &

# Adjust screen lighting to location
wlsunset -l 59.34857:17.87905 &

# Lock the screen after 300 seconds, turn off the screen after another 300
# and also lock the screen  before sleep, this command is the same as idle.sh
idle.sh startup &

# Useful to prevent idle when watching movies etc.
# Not yet in the current version of river on the void repos, leaving it here for future reference
# sway-audio-idle-inhibit &

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
