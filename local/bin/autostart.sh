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
swayidle -w	timeout 300 "lock.sh" timeout 600 "wlopm --off '*'" timeout 900 "loginctl suspend" resume "wlopm --on '*'" before-sleep "lock.sh" &

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
