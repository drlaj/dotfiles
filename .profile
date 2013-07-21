# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
    return
fi

PATH=${PATH}:~/Bin:/usr/local/share/npm/bin
export PATH

# colorful term
export CLICOLOR=1

# increase history limit 
export HISTSIZE=5000

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# history format
export HISTTIMEFORMAT='%h %d %H:%M:%S> '

# make bash append rather than overwrite the history on disk 
shopt -s histappend

# color grep output
export GREP_OPTIONS='--color=auto'

# auto-correct directory spelling errors
shopt -s cdspell

# wrap lines correctly after resizing windows
shopt -s checkwinsize

# ensure * includes hidden files and folders
shopt -s dotglob

# expand aliases
shopt -s expand_aliases

# use VIM
export EDITOR=vim

# show auto-completion suggestions
set autoexpand

# remove case sensitive auto-completion
set complete=enhance

set autocorrect

# chase symbolic links
set symlinks=chase

# confirm rm *
set rmstar

# aliases
alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias c='clear'
alias h='history'
alias x='exit'
alias la='ls -aF'
alias ls='ls -ls'
