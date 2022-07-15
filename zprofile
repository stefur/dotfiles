#if test -z "${XDG_RUNTIME_DIR}"; then
#	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
#	if ! test -d "${XDG_RUNTIME_DIR}"; then
#		mkdir "${XDG_RUNTIME_DIR}"
#		chmod 0700 "${XDG_RUNTIME_DIR}"
#	fi
#fi

export XKB_DEFAULT_LAYOUT=se
export SDL_VIDEODRIVER=wayland
export ELM_DISPLAY=wl
export QT_QPA_PLAYFORM=wayland-egl
export MOZ_ENABLE_WAYLAND=1
