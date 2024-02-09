export XKB_DEFAULT_LAYOUT=se
# export SDL_VIDEODRIVER=wayland # this causes issues launching some Steam games.
export ELM_DISPLAY=wl
export QT_QPA_PLATFORM=xcb
export MOZ_ENABLE_WAYLAND=1
export TERM="foot"

# Rye
. "$HOME/.rye/env"

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Start river
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
  echo "Select compositor"
  select compositor in "river" "qtile"; do
      case $compositor in
          river ) exec dbus-run-session river;;
          qtile ) exec dbus-run-session qtile start -b wayland;;
      esac
  done
fi
