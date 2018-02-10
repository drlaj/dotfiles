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

# Aliases
alias cd..='cd ..'
alias cd.='cd ..'

alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'

alias c='clear'
alias h='history'
alias x='exit'

alias ls='ls -lG'
alias la='ls -AG'

# Use Vim
export EDITOR=vim
alias vim=/usr/local/bin/vim
alias vi='vim'

# Force rm * to ask 
set rmstar

#export PATH="$PATH:`yarn global bin`" this slowed startup so replaced with:
export PATH="$PATH:/user/local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/drlaj/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/drlaj/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/drlaj/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/drlaj/google-cloud-sdk/completion.zsh.inc'; fi

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

HISTSIZE=1000
SAVEHIST=1000

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

#==============================================================================
# HELPERS
#==============================================================================

# Move last downloaded file to current directory
ldf() {
  mv ~/Downloads/*(mh-3[1]) .
}

# nvm init adds seconds to terminal loading
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# so lets defer init of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
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
