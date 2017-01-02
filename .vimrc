" drlaj .vimrc

" be iMproved, required
set nocompatible
filetype off

"----- Vundle -----"

" set the runtime path to include Vundle and intialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" keepers
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'elzr/vim-json'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'tpope/vim-repeat'
"Plugin '1995eaton/vim-better-javascript-completion'

" required
call vundle#end()

" required
filetype plugin indent on

"----- GENERAL -----"

" turn on syntax highlighting
syntax enable

" set mapleader to comma
let mapleader = "\<Space>"

" set jj to escape
imap jj <Esc>

" increase vim history size
set history=1000

" no sounds
set visualbell

" turn on line numbering
set number

" show partial command
set showcmd

" hide --INSERT--
set noshowmode

" always show a status line
set laststatus=2

" set minimal number of lines to scroll when the cursor goes off the screen
set so=10

" CTRL-e and CTRL-y each page 10 lines
:nnoremap <C-e> 10<C-e>
:nnoremap <C-y> 10<C-y>

" copy indent from current line when starting a new line
set autoindent

" perform smart indenting when starting a new line
set smartindent

" set UTF-8 as the standard encoding
set encoding=utf-8

" automatically read the file again when changes are detected outside vim
set autoread

" x deletes
vnoremap x "_x

" X backspaces
vnoremap X "_X

" backspace is dumb and behaves as expected
set backspace=2

" set shell
set shell=zsh

" no backup files
set nobackup

" no swap files
set noswapfile

" easy switching from unsaved hidden buffers
set hidden

" enable completion
set omnifunc=syntaxcomplete#Complete

" set change marker
set cpoptions+=$

" cmd wrap turns on wordwrap
" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

" customise hidden characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<

" copy out of vim
set clipboard=unnamed

" unix cmdline modifiers work on the vim cmd line
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>

" set keystroke to quickly toggle paste mode
set pastetoggle=<F9>

" my eyes!
colorscheme Tomorrow-Night
set t_Co=256

"----- TABS/SPACES -----"

" great explanation here: http://vimcasts.org/episodes/tabs-and-spaces/

" turn tabs into spaces
set expandtab

" specify width of a tab character
set tabstop=2

" set number of spaces to use for each step of indent
set shiftwidth=2

" make tab/backspace in insert mode behave the same as indent commands in normal mode
set softtabstop=2

" round indent to multiple of shiftwidth
set shiftround

" insert tabs on the start of a line according to shiftwidth
set smarttab

"----- SEARCH/MATCHING -----"

" move the cursor to the matched string as you type
set incsearch

" highlight all matches
set hlsearch

" matching ignores case
set ignorecase

" matching listens to case when search pattern specifies it
set smartcase

" hitting enter clears search
noremap <CR> :nohlsearch<CR>

" keep matches in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

"----- SPELLING -----"

" pressing ,ss will toggle spell checking
nmap <leader>ss :setlocal spell!<CR>

" goto next spelling error
nmap <leader>sn ]s

" goto previous spelling error
nmap <leader>sp [s

" add the highlighted word to the dictionary
nmap <leader>sa zg

" show spelling suggestions
nmap <leader>s? z=

"----- SHORTCUTS -----"

" natural line movements when text is wrapped
nmap j gj
nmap k gk

" quickly edit vimrc
nmap ;v :e ~/.vimrc<CR>

" quickly source vimrc
nmap ;u :source ~/.vimrc<CR>

" quickly toggle hidden characters
nmap <leader>l :set list!<CR>

" quickly move to the current working directory
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" quickly list buffers
nmap <C-b> :ls<cr>

" quickly move between buffers
nmap <right> :bn<CR>
nmap <left> :bp<CR>

" quickly move between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" quickly open home directory
cmap $h e ~/

" quickly open desktop directory
cmap $d e ~/Desktop/

" quickly open current directory
cmap $$ e ./

"----- STATUSLINE -----"

set statusline =%#identifier#

" tail of the file name
set statusline+=[%t]
set statusline+=%*

" filetype
set statusline+=%y

" read-only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

" paste flag
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" switch to right side of status line
set statusline+=%=

" cursor column
set statusline+=%c-

" cursor line/total lines
set statusline+=%l/%L

"----- PLUGIN CONFIG -----"

""""" nerdtree

" ,n toggles nerd tree
:noremap ,n :NERDTreeToggle<cr>

" ,r goto directory of current file
:noremap ,r :NERDTreeFind<cr>

" show hidden files by default
let NERDTreeShowHidden=0

""""" ctrlp

" files
nnoremap <leader>f :CtrlP<CR>

" buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" recents
nnoremap <leader>m :CtrlPMRUFiles<CR>

" place match window at the bottom
let g:ctrlp_match_window_bottom = 1

" set max height of the match window
let g:ctrlp_max_height = 10

" specify local working directory
let g:ctrlp_working_path_mode = 'ra'

" scan dot files and folders
let g:ctrlp_show_hidden = 1

" ignore intermediates, version controlled files and media
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|node_modules'

""""" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

"----- HELPERS -----"

" remove trailing whitespace from all lines
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

nmap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
