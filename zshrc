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

# Fixing some keys to work as I expect them to
# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\C-_"    backward-kill-word
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
# alt-bs
bindkey "\e\d"  undo

# Bind page up/down to insert nothing because I'm clumsy
bindkey -s "^[[5~" ""
bindkey -s "^[[6~" ""

alias ls="ls -al --color=auto --hyperlink=auto --group-directories-first -h"

# Colorize grep output (good for log files)
alias grep="grep --color=auto"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# human-readable sizes
alias df="df -h"

# Case-insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# My plugins from the .zsh folder
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# This MUST be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
