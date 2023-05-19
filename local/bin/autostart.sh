#!/bin/sh

# Set the brightness since it defaults to 100% on boot
brightnessctl set 20%

# Start the gpg agent
gpg-connect-agent &

# Pick a random wallpaper
file=$(ls ~/wallpapers | shuf -n 1)
swaybg -m fill -i ~/wallpapers/$file &

# Blur the wallpaper and put a copy in tmp location for lock screen usage
convert ~/wallpapers/$file -blur 16x8 /tmp/lock_img.jpg &

# Start the bar...
waybar &

# And my Spotify listener :)
lystra --playing "󰐊 " --paused "󰏤 " --playbackcolor "#9CABCA" --mediaplayer "spotify" --autotoggle &

# And then syncthing to keep files all up to date
syncthing &

# Pipewire for audio
pipewire &
pipewire-pulse &
wireplumber &

# Notifications daemon
mako &

# Adjust screen lighting to location
wlsunset -l 59.3:17.8 &

# Multimonitor management
kanshi &

# Lock the screen after 300 seconds, turn off the screen after another 300
# and also lock the screen before sleep.
swayidle -w	timeout 300 "lock.sh" timeout 600 "wlopm --off '*'" resume "wlopm --on '*'" timeout 900 "loginctl suspend" before-sleep "lock.sh" &

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
