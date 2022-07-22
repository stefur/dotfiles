# Save most-recent 1000 lines
HISTSIZE=20000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Override autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#e7c664,underline"

# Set the prompt
PROMPT="%B%F{66}%n%f%b %B%F{102}%~%f%b %B%F{102}$%f%b "

# Use gpg-agent instead of ssh-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Electron app flags for wayland
alias Discord="Discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias signal-desktop="signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland"

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# Case-insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# My plugins from the .zsh folder
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# This MUST be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
