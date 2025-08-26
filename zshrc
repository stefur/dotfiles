# Save most-recent 1000 lines
HISTSIZE=20000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups

# Override autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#e7c664,underline"

# Set the prompt and level indicators
PROMPT="%B%F{66}%n%f%b %B%F{102}%~%f%b %B%F{102}$%f%b "
if [[ $SHLVL -gt 1 ]]; then
  case $SHLVL in
      2) PROMPT="%B%F{130}᎓%f%b ${PROMPT}" ;;
      3) PROMPT="%B%F{130}⁖%f%b ${PROMPT}" ;;
      4) PROMPT="%B%F{130}⁘%f%b ${PROMPT}" ;;
      *) PROMPT="%B%F{130}⁜ ${SHLVL}%f%b ${PROMPT}" ;;
  esac            
fi

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

# Search with Ctrl + R and use Ctrl + Up/Down to move in results. Ctrl + E to accept.
bindkey "^[[1;5A" history-incremental-search-backward
bindkey "^[[1;5B" history-incremental-search-forward

# Regular Up or Down to move through history
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

alias ngc="nix-collect-garbage"
# Toggle monitor to TB/DP
alias tm='ddcutil getvcp 60 | grep -q "0x0f" && ddcutil setvcp 60 10 || ddcutil setvcp 60 15'

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
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit

# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

. "$HOME/.cargo/env"
