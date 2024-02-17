export XKB_DEFAULT_LAYOUT=se
export XDG_CONFIG_HOME=$HOME/.config
export QT_QPA_PLATFORM=wayland-egl
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland

# Rye
. "$HOME/.rye/env"

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
  echo "Select compositor"
  select compositor in "river" "qtile" "tty"; do
      case $compositor in
          river ) exec dbus-run-session river;;
          qtile ) exec dbus-run-session qtile start -b wayland;;
          tty ) exec /usr/bin/zsh;;
      esac
  done
fi
