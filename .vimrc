" drlaj .vimrc

"" Vundle
"" General
"" Colours
"" Tabs/Spaces
"" Search/Matching
"" Spelling
"" Shortcuts
"" Statusline
"" Plugin Config
"" Hitlist

" be iMproved, required
set nocompatible
filetype off

"""""""""" Vundle

" set the runtime path to include Vundle and intialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" keepers
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'


" experimental
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'Shutnik/jshint2.vim'
  " let jshint2_save = 1
  " let jshint2_close = 0
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/yajs.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'kshenoy/vim-signature'
"  let g:mustache_abbreviations=1
"Plugin 'Raimondi/delimitMate'
"    let g:delimitMate_expand_cr = 1
"    let g:delimitMate_expand_space = 1
"    imap <C-c> <CR><ESc>O

" required
call vundle#end()

" required
filetype plugin indent on



"""""""""" General

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
set nu

" show available command completions
set showcmd

" always show a status line
set laststatus=2

" set height of the command-line
set ch=1

" set minimal number of lines to scroll when the cursor gets off the screen
set so=7

" CTRL-e and CTRL-y each page 10 lines
:nnoremap <C-e> 10<C-e>
:nnoremap <C-y> 10<C-y>

" copy indent from current line when starting a new line
set autoindent

" perform smart indenting when starting a new line
set smartindent

" set UTF-8 as the standard encoding
set enc=utf-8

" turn on autoread
set autoread

" simple delete and backspace
vnoremap x "_x
vnoremap X "_X

" set shell
set shell=zsh

" set change marker
set cpoptions+=$

" turn off backup and swap files
set nobackup
set noswapfile

" easy switching from unsaved hidden buffers
set hidden

" highlight current line
set cursorline

" enable completion
set omnifunc=syntaxcomplete#Complete

" cmd wrap turns on wordwrap
" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

" backspace behaves as expected
set bs=2

"""""""""" Colours

" solarized
set term=xterm-256color
set background=dark
colorscheme solarized



"""""""""" Tabs/Spaces

" http://vimcasts.org/episodes/tabs-and-spaces/

" expand tabs into spaces
set expandtab

" specify width of a tab character
set tabstop=2

" set number of spaces to use for each step of indent e.g. << or >> in normal mode
set shiftwidth=2

" make tab and backspace in insert mode behave the same as indent commands in normal mode
set softtabstop=2

" round indent to multiple of shiftwidth
set shiftround

" insert tabs on the start of a line according to shiftwidth
set smarttab



"""""""""" Search/Matching

" move the cursor to the matched string
set incsearch

" highlight all matches
set hlsearch

" hitting enter clears search
noremap <CR> :nohlsearch<CR>

" keep searches in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" set search to ignore case
set ignorecase

" override ignorecase when the pattern contains upper case characters
set smartcase



"""""""""" Spelling

" pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<CR>

" goto next error
map <leader>sn ]s

" goto previous error
map <leader>sp [s

" add the word to the dictionary
map <leader>sa zg

" show suggestions
map <leader>s? z=

" hide the default mode text
set noshowmode



"""""""""" Shortcuts

" quickly edit vimrc
nmap ;v :e ~/.vimrc<CR>

" quickly source vimrc
nmap ;u :source ~/.vimrc<CR>

" ,l to display hidden characters
" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:▸\ ,eol:¬

" quick opens
cno $h e ~/
cno $d e ~/Desktop/
cno $$ e ./
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" ,cd changes to the current working directory
noremap ,cd :cd %:p:h<CR>:pwd<CR>

" quick buffer movements
map <right> :bn<CR>
map <C-n> :bn<CR>
map <left> :bp<CR>
map <C-p> :bp<CR>

" unix cmdline modifiers work on the vim cmd line
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

" shortcut list buffers
map <C-b> :ls<cr>

" Remove trailing whitespace from all lines
" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

"nnoremap <F5> :%s/\s\+$//e<CR>



"""""""""" Statusline

"set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

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
set statusline+=%c,

" cursor line/total lines
set statusline+=%l/%L



"""""""""" Plugin Config



""" config for 'kien/ctrlp.vim'

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



""" config for 'scrooloose/nerdtree'

" ,n toggles nerd tree
:noremap ,n :NERDTreeToggle<cr>

" ,r goto directory of current file
:noremap ,r :NERDTreeFind<cr>

" show hidden files by default
let NERDTreeShowHidden=0


""" config for 'scrooloose/syntastic'

let g:syntastic_javascript_checkers=['jshint']

let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }

" from https://github.com/scrooloose/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""" config for 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview


""" config for Plugin 'marijnh/tern_for_vim'
" let g:tern_map_keys=1
" let g:tern_show_argument_hints='on_hold'



"""""""""" Shitlist

" force sudo for open file
" cmap w!! w !sudo tee % >/dev/null

" do not show tabs on html and xml files
" autocmd filetype html,xml set listchars-=tab:>.

" do not add comment prefix when I enter or o/O on a comment line
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"if has("autocmd")
"  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"  autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
"endif
