" drlaj .vimrc
" Don't put any lines in your vimrc that you don't understand

"==============================================================================
" VIM-PLUG - https://github.com/junegunn/vim-plug
"==============================================================================
silent! if plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'kien/ctrlp.vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()
endif

"==============================================================================
" BASIC SETTINGS
"==============================================================================

augroup vimrc
  autocmd!
augroup END

let mapleader       = "\<Space>"
let maplocalleader  = "\<Space>"

set nocompatible
set nu
set autoindent
set smartindent
set visualbell
set showcmd
set laststatus=2
set encoding=utf-8
set autoread
set backspace=2
set lazyredraw
set shortmess=aIT
set shell=zsh
set nobackup
set noswapfile
set hidden
set cpoptions+=$
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<
set clipboard=unnamed
set pastetoggle=<F9>
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set incsearch
set ignorecase
set smartcase
set omnifunc=syntaxcomplete#Complete
set synmaxcol=1000
set nostartofline
set textwidth=0
set colorcolumn=80
set wildmenu

" Status line config
set statusline=
set statusline+=[%n]                    " buffer number
set statusline+=%#error#                " paste flag
set statusline+=\[%F]                   " full path to the current file
set statusline+=%*                      " restore normal highlight
set statusline+=\ %m                    " readonly flag
set statusline+=\ %r                    " modified flag
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}  " paste flag
set statusline+=%*                      " restore normal highlight
set statusline+=%=                      " switch to the right side
set statusline+=%l                      " current line
set statusline+=/                       " separator
set statusline+=%L                      " total line numbers

" Nice colors via base16 - http://chriskempson.com/projects/base16
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif
colorscheme base16-tomorrow-night

" Fast searching via The Silver Searcher - http://geoff.greer.fm/ag
if executable('ag')
  " Use ag for grepping
  set grepprg=ag\ --nogroup\ --nocolor

	" Ctrlp can use ag 
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Ctrlp does not have to cache when using ag
  let g:ctrlp_use_caching = 0
endif

" Remove trailing white spaces from all lines
function! <SID>RemoveTrailingWhitespaceFromAllLines()
  let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>RemoveTrailingWhitespaceFromAllLines()<CR>

" Quickly close help buffers
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

"==============================================================================
" MAPPINGS
"=============================================================================

" Quickly edit vimrc
nnoremap ;v :e ~/.vimrc<CR>

" Quickly source vimrc
nnoremap ;u :source ~/.vimrc<CR>

" Quickly toggle hidden characters
nnoremap <leader>l :set list!<CR>

" Quickly change to current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Quickly list buffers
nnoremap <C-b> :ls<CR>

" Quickly close the quickfix window
nnoremap <C-c> :cclose<CR>

" Quickly move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctrl-e and ctrl-y each page 10 lines
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" Set jj to escape
inoremap jj <Esc>

" Simple line movements when text is wrapped
nnoremap j gj
nnoremap k gk

" UNIX cmd line modifiers work on vim cmd line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
" persist ctrl-f to switch from commandline to commandline window
cnoremap <expr> <C-f> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

" K greps the word under the cursor
nnoremap K :grep! --word-regexp "<C-r><C-w>"<CR>:cw<CR> " good!

" Place the current match at the center of the window
nnoremap <plug>(slash-after) zz

" Simplify opening files, via http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"==============================================================================
" PLUGINS
"==============================================================================

"------------------------------------------------------------------------------
" Nerdtree
"------------------------------------------------------------------------------

" ,n toggles nerd tree
:nnoremap ,n :NERDTreeToggle<CR>

" ,r goto directory of current file
:nnoremap ,r :NERDTreeFind<CR>

" do not collapse single folder nodes
let NERDTreeCascadeSingleChildDir=0

"------------------------------------------------------------------------------
" Ctrlp
"------------------------------------------------------------------------------

" Search files
nnoremap <leader>f :CtrlP<CR>

" Search buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" Search recent files
nnoremap <leader>m :CtrlPMRUFiles<CR>

" Ctrlp window config
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Ctrlp working directory
let g:ctrlp_working_path_mode = 'ra'

" Ctrlp to search hidden files and folders
let g:ctrlp_show_hidden = 1

" Ctrlp exclude list
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|node_modules'

"------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

"------------------------------------------------------------------------------
" JSX
"------------------------------------------------------------------------------

let g:jsx_ext_required = 0
