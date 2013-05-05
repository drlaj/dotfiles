" drlaj .vimrc

" be iMproved
" required!
set nocompatible
filetype on 

""""" vundle

" append vundle to runtime path
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" github repos
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-haml'
Bundle 'sjl/gundo.vim'

" Bundle 'jcf/vim-latex'
" Bundle 'tsaleh/vim-matchit'
" Bundle 'skwp/vim-rspec'
" Bundle 'tomtom/tcomment_vim'
" Bundle 'ervandew/supertab'
" Bundle 'gmarik/snipmate.vim'
" Bundle 'cakebaker/scss-syntax.vim'

" Bundle 'Lokaltog/powerline' 
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" vim-scripts repos
Bundle 'repeat.vim'

" enable filetype plugins
filetype plugin indent on " required!
filetype plugin on

" quickly edit and source vimrc
nmap ;v :e ~/.vimrc<CR>
nmap ;u :source ~/.vimrc<CR>

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" color preferences
set term=xterm-256color
set background=dark
colorscheme solarized

" increase vim history size
set history=1000

" set mapleader to comma
let mapleader = ","

" no sounds please
set visualbell

" turn on syntax highlighting
syntax on

" turn on line numbering
set nu

" move the cursor to the matched string
set incsearch

" highlight all matches
set hlsearch

" set enter to clear highlight
noremap <CR> :nohlsearch<CR>

" keep searches in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" set search to ignore case
set ignorecase

" ignore case when the pattern is all lowercase
set smartcase

" Ctrl-e and Ctrl-y page 10 lines
:nnoremap <C-e> 10<C-e>
:nnoremap <C-y> 10<C-y>

" set jj to escape
imap jj <Esc>

" display file name in terminal window title
set title

" set vertical space between lines
set linespace=1

" show available command completions
set showcmd

" set command line height 
set ch=2

" always show a status line
set laststatus=2

""""" tabs, text and indentation

" replace tabs with spaces
set expandtab

" set tab equal to two spaces
set tabstop=2

" specify column width for reindent operations << and >>
set shiftwidth=2

" round spaces to nearest tab when using << >>
set shiftround

" insert tabs on the start of a line according to shiftwidth
set smarttab

" sensible indentation replacements
set softtabstop=2

" cmd wrap turns on wordwrap
command! -nargs=* Wrap set wrap linebreak nolist

",l shows invisible characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

" do not show tabs on html and xml files
autocmd filetype html,xml set listchars-=tab:>.

" turn on auto indent
set autoindent

" perform smart indenting when starting a new line
set smartindent

" do not add comment prefix when I enter or o/O on a comment line
" set formatoptions-=or
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" turn on autoread
set autoread

" common opens
cno $h e ~/
cno $d e ~/Desktop/
cno $c e ~/Code/
cno $$ e ./

" fast edits to current directory
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

""""" spelling

" pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<CR>

" goto next error
map <leader>sn ]s

" goto previous error
map <leader>sp [s

" add the word to the good list
map <leader>sa zg

" show suggestions
map <leader>s? z=

" hide the default mode text
set noshowmode

" simple delete and backspace
vnoremap x "_x
vnoremap X "_X

""""" backups

set nobackup
set noswapfile
" set undodir=~/.vim/tmp/undo/
" set backupdir=~/.vim/tmp/backup/
" set directory=~/.vim/tmp/swap/

""""" autocompletion

set ofu=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby set ai sw=2 sts=2 et

autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" map ,cd to change to the directory of the open file
noremap ,cd :cd %:p:h<CR>:pwd<CR>

" tabs
" map <C-t> <esc>:tabnew<CR>

" buffer movements
map <right> :bn<CR>
map <left> :bp<CR>
map <C-n> :bn<CR>
map <C-p> :bp<CR>

" unix cmd line modifiers work on the vim cmd line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

" move a line of text using CMD+[jk]
nmap <D-j> mz:m+<CR>`z
nmap <D-k> mz:m-2<CR>`z
vmap <D-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<CR>`>my`<mzgv`yo`z

" natural line movements when wrapped
nnoremap j gj
nnoremap k gk

" streamline window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" force sudo for open file
cmap w!! w !sudo tee % >/dev/null

set hidden

" shortcut list buffers
map <C-b> :ls<cr>

""""" ctrlp tree plugin

" files
nnoremap <leader>f :CtrlP<CR>

" buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" recents
nnoremap <leader>m :CtrlPMRUFiles<CR>

" place match window at the bottom
let g:ctrlp_match_window_bottom = 1

" set max height of the match window 
let g:ctrlp_max_height = 15

" specify local working directory
let g:ctrlp_working_path_mode = 'ra'

" scan dot files and folders
let g:ctrlp_show_hidden = 1

" ignore intermediates, version controls files and media
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

""""" nerd tree plugin

" toggle NERD tree
:noremap ,n :NERDTreeToggle<cr>

" open directory of current file
:noremap ,r :NERDTreeFind<cr>

" show hidden files by default
let NERDTreeShowHidden=1

set shell=zsh

" :autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl


""""" multipurpose tab key

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""" rename current file

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>s :call RenameFile()<cr>
