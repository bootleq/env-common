# Options ref: http://zsh.sourceforge.net/Doc/Release/Options.html#SEC99

export LANG=zh_TW.UTF-8

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# disable START/STOP output control (<C-S>, <C-Q>)
stty -ixon

# Cd
# cdpath=(~ /home/www/webroot)

# WORDCHARS
# default: *?_-[]~=/&;!#$%^(){}<>
WORDCHARS='_'

# Status display {{{

  # Prompts
  autoload -U colors && colors
  PS1=$'\n'"%{$fg[green]%}%T@%m %{$fg[yellow]%}%~ %{$reset_color%}"$'\n$ '

  # Term title
  case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
    precmd () { print -Pn "\e]0;%~\a" }
    ;;
  esac

# }}} Status display

# History {{{
  export HISTFILE=~/.zhistory
  setopt APPEND_HISTORY
  setopt HIST_VERIFY
  setopt INC_APPEND_HISTORY
  setopt EXTENDED_HISTORY
  export HISTSIZE=1200
  export SAVEHIST=999
  setopt HIST_FIND_NO_DUPS
  setopt HIST_IGNORE_DUPS
  setopt HIST_IGNORE_ALL_DUPS
  setopt SHARE_HISTORY
  export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:vim"
# }}} History

# Colors {{{

  if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  else
    export TERM='xterm-color'
  fi

  # directory color
  export LS_COLORS='di=33'

# }}} Colors

# Aliases {{{
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
# }}} Aliases

# Bindkey {{{

  bindkey "OD" backward-word
  bindkey "OC" forward-word

  bindkey "^[[H" beginning-of-line
  bindkey "^[[F" end-of-line
  bindkey "^[[3~" delete-char
  # bindkey "^[[5~" history-search-backward # PageUp
  # bindkey "^[[6~" history-search-forward # PageDown
  bindkey "^Z" undo
  bindkey '' redo
  bindkey "^Y" yank
  bindkey '^[[Z' reverse-menu-complete # S-Tab
  bindkey "^_" backward-delete-word # C-BS
  bindkey "" kill-whole-line

# }}} Bindkey

# Completion {{{

  setopt AUTO_LIST
  setopt AUTO_MENU
  setopt LIST_PACKED
  setopt AUTO_PUSHD
  setopt AUTO_PARAM_KEYS
  setopt CORRECT
  setopt globdots

  autoload -Uz compinit
  compinit

  zstyle ':completion:*' completer _expand _complete _match
  zstyle ':completion:*' completions 0
  zstyle ':completion:*' use-cache true
  zstyle ':completion:*' cache-path ~/.zsh/cache
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  #zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
  zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
  zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
  zstyle ':completion:*:cd:*' tag-order local-directories path-directories

  user-complete(){
    if [[ -n $BUFFER ]] ; then
      zle expand-or-complete
    else
      BUFFER="./"
      zle end-of-line
      zle expand-or-complete
    fi }
  zle -N user-complete
  bindkey "\t" user-complete

  basehost="" 
  hosts=($((( [ -r .ssh/known_hosts ] && awk '{print $1}' .ssh/known_hosts | tr , '\n');echo $basehost; ) | sort -u) )
  zstyle ':completion:*' hosts $hosts

  zstyle ':completion:*:*:kill:*' menu yes select

  # Group
  zstyle ':completion:*:matches' group 'yes'
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*:options' description 'yes'
  zstyle ':completion:*:options' auto-description '%d'
  zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
  zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
  zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
  zstyle ':completion:*:*:-command-:*' group-order builtins functions commands
  zstyle ':completion:*:*:-command-:*' list-packed 'true'

  # List
  zmodload zsh/complist
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*:*' list-colors 'di=01;36'
  zstyle ':completion:*' max-errors 2 numeric
  zstyle ':completion:*' menu select=1 _complete _ignored _approximate
  zstyle ':completion:*' select-prompt %SScrolling: at %p - %L%s
  zstyle ':completion:*' substitute 0

  zstyle :compinstall filename '~/.zshrc'

# }}} Completion
