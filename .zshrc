# drlaj .zshrc
# Don't put any lines in your zshrc that you don't understand

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#export TERM=xterm-256color
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

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
