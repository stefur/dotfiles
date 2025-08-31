#!/bin/sh
case "${1}" in
	battery)
        message="Battery $(acpi | grep -o [0-9]*%)"
        notify-send $message
        ;;
    date)
        weeknumber=$(date +%V)
        date=$(date +%e | cut -d " " -f2)
        month=$(date +%B)
        day=$(date +%A)
        message="$date $month ($day) Week $weeknumber"
        notify-send "Today" "$message"
        ;;
    wifi)
        interface=$(iw dev | awk '$1=="Interface"{print $2}')
        connection=$(iw dev $interface link | awk '$1=="SSID:"{first = $1; $1=""; print $0}' | sed 's/^ //g')
        notify-send "Wifi" "$connection"
        ;;
    playpause)
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
        ;;
    nextsong)
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
        ;;
esac

