# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

setopt prompt_subst

local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# use vim
export EDITOR=vim
alias vi='vim'

# confirm rm *
set rmstar

setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

# friendly rm, cp, mv
alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'

# quick shortcuts
alias c='clear'
alias h='history'
alias x='exit'

# make ls show long format with colorised output
alias ls='ls -lG'

# make la show hidden but not . and .. with colorised out
alias la='ls -AG'

# completion system
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*' menu select=1 interactive

# break into as manay groups as necessary 
zstyle ':completion:*' group-name ''

# specify the order of groupings
zstyle ':completion:*:*:-command-:*' group-order builtins functions commands

# directories before files
zstyle ':completion:*' list-dirs-first true 

# color completion menus 
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=34=31"

zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' completer _expand _complete _approximate _ignored

# increase number of events written to history file
SAVEHIST=10000

# increase number of events stored in the internal history list
HISTSIZE=10000

# force all sessions to append their history to the history list 
setopt INC_APPEND_HISTORY

# retrieve history across all sessions
setopt SHARE_HISTORY

# if a new command being added duplicates an older one, remove the older one from the list
setopt HIST_IGNORE_ALL_DUPS 

# remove superflous blanks from each command line being added to the history
setopt HIST_REDUCE_BLANKS

# when using history expansion, don't execute the line directly; instead perform expansion and reload into the editing buffer
setopt HIST_VERIFY

# when searching for history entries in the line editor, do not display duplicates of a line previously found
setopt HIST_FIND_NO_DUPS

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
