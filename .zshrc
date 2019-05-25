# drlaj .zshrc
# Don't put any lines in your zshrc that you don't understand

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#==============================================================================
# BASIC SETTINGS
#==============================================================================

alias cd..='cd ..'
alias cd.='cd ..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias c='clear'
alias h='history'
alias x='exit'

alias ls='ls -lG'
alias la='ls -AG'

export EDITOR=nvim
alias vim=nvim
alias vi=nvim

# use bat over cat
alias cat='bat'

# fast preview
alias preview="fzf --preview 'bat --color \"always\" {}'"

# force rm * to ask
set rmstar

export PATH="$PATH:/user/local/bin"

#-------------------------------------------------------------------------------
# Zsh completion
#-------------------------------------------------------------------------------

zstyle ':completion:*' completer _expand _complete _approximate _ignored
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select interactive
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:default' list-colors "=(#b) #([0-9]#)*=34=31"
zstyle ':completion:*:default' list-prompt '%M'

#-------------------------------------------------------------------------------
# Zsh search
#-------------------------------------------------------------------------------

setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT

#-------------------------------------------------------------------------------
# Zsh history
#-------------------------------------------------------------------------------

HISTSIZE=2500
SAVEHIST=2500

# Do not display duplicates of a line previously found
setopt HIST_FIND_NO_DUPS

# Do replace older duplicates with the latest entry
setopt HIST_IGNORE_ALL_DUPS

# Do not execute the line directly when using history expansion
setopt HIST_VERIFY

# Do not create empty history rows
setopt HIST_REDUCE_BLANKS

# Do write after each command
setopt INC_APPEND_HISTORY

# Do share history between sessions
setopt SHARE_HISTORY

#==============================================================================
# PLUGINS
#==============================================================================

# Pure prompt
autoload -U promptinit; promptinit
prompt pure

# Nice colors via Base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Add fzf key bindings and completions to path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add tmux key completions to path
[ -f ~/.bin/tmuxinator.zsh ] && source ~/.bin/tmuxinator.zsh

# Add gcloud paths and completions to path
if [ -f '/Users/drlaj/google-cloud-sdk/path.zsh.inc' ]; then
  source '/Users/drlaj/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/Users/drlaj/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/Users/drlaj/google-cloud-sdk/completion.zsh.inc';
fi

#==============================================================================
# HELPERS
#==============================================================================

# Move last downloaded file to current directory
function ldf() {
  mv ~/Downloads/*(mh-3[1]) .
}

# Prevent nvm slowing down terminal loads
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
