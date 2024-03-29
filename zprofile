export XKB_DEFAULT_LAYOUT=se
export XDG_CONFIG_HOME=$HOME/.config
export QT_QPA_PLATFORM=wayland-egl
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export GNUPGHOME=$HOME/.config/gnupg

# Rye
. "$HOME/.rye/env"

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
  echo "Select:"
  select compositor in "river" "tty"; do
      case $compositor in
          river ) exec dbus-run-session river;;
          tty ) exec /usr/bin/zsh;;
      esac
  done
fi
