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
bindkey "^H" backward-kill-word
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
# alt-bs to undo
bindkey "\e\177" undo

# Bind page up/down to insert nothing because I'm clumsy
bindkey -s "^[[5~" ""
bindkey -s "^[[6~" ""

# Ctrl + R to open a search minibuffer, Ctrl + E to accept result
history-incremental-search-{back,for}ward() {
  local saved_BUFFER=$BUFFER saved_CURSOR=$CURSOR error
  BUFFER=
  zle .$WIDGET -- $saved_BUFFER
  error=$?
  if (( error )) BUFFER=$saved_BUFFER CURSOR=$saved_CURSOR
  return error
}

# Ctrl + Up or Down to search through history from beginning of cursor position
autoload -Uz history-incremental-search-backward
autoload -Uz history-incremental-search-forward
zle -N history-incremental-search-backward
zle -N history-incremental-search-forward
bindkey "^[[1;5A" history-beginning-search-backward
bindkey "^[[1;5B" history-beginning-search-forward

# Regular Up or Down to move through history
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

alias ls="ls -al --color=auto --hyperlink=auto --group-directories-first -h"

# Colorize grep output (good for log files)
alias grep="grep --color=auto"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# human-readable sizes
alias df="df -h"

# void admin
alias xu="sudo xbps-install -Svu"
alias xi="sudo xbps-install -Sv"
alias xr="sudo xbps-remove -Rv"
alias xc="sudo xbps-remove -ROov"
alias xq="xbps-query -Rs"

# Case-insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# My plugins from the .zsh folder
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# This MUST be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
