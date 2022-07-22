export XKB_DEFAULT_LAYOUT=se
export SDL_VIDEODRIVER=wayland
export ELM_DISPLAY=wl
export QT_QPA_PLAYFORM=wayland-egl
export MOZ_ENABLE_WAYLAND=1
export EDITOR="vim"

# Use gpg-agent instead of ssh-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Start river
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
    exec dbus-run-session river
fi
