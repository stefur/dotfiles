export XKB_DEFAULT_LAYOUT=se
# export SDL_VIDEODRIVER=wayland # this causes issues launching some Steam games.
export ELM_DISPLAY=wl
export QT_QPA_PLATFORM=xcb
export MOZ_ENABLE_WAYLAND=1
export EDITOR="vim"
export TERM="foot"

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Start river
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
    exec dbus-run-session river
fi
