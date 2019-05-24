" drlaj .vimrc
" Don't put any lines in your vimrc that you don't understand

"==============================================================================
" VIM-PLUG - https://github.com/junegunn/vim-plug
"==============================================================================
silent! if plug#begin('~/.vim/plugged')

" Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-slash'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'leafgarland/typescript-vim'

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
if $TMUX == ''
  set clipboard+=unnamed
endif
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
colorscheme base16-default-dark

" Fast searching via The Silver Searcher - http://geoff.greer.fm/ag
if executable('ag')
  " Use ag for grepping
  " set grepprg=ag\ --nogroup\ --nocolor
  "let g:ackprg = 'ag --nogroup --nocolor --column'"
  " let g:ackprg = 'ag --vimgrep'

	" Ctrlp can use ag
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Ctrlp does not have to cache when using ag
  " let g:ctrlp_use_caching = 0
endif

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
nnoremap K :grep! --word-regexp "<C-r><C-w>"<CR>:cw<CR>

" Place the current match at the center of the window
nnoremap <plug>(slash-after) zz

" Simplify opening files, via http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Fix common typos
map <silent> q: :q<Cr>
map <silent> Q: :q<Cr>
map <silent> :Q :q<Cr>

let g:loaded_ruby_provider = 1

"------------------------------------------------------------------------------
" NERDtree
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

" Search files on space-f
" nnoremap <leader>f :CtrlP<CR>

" Search buffers on space-b
" nnoremap <leader>b :CtrlPBuffer<CR>

" Search recent files on space-m
" nnoremap <leader>m :CtrlPMRUFiles<CR>

" Ctrlp window config
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Ctrlp working directory
" let g:ctrlp_working_path_mode = 'ra'

" Ctrlp to search hidden files and folders
" let g:ctrlp_show_hidden = 1

" Ctrlp exclude list
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Trying LeaderF instead of CTRL P
noremap <Leader>m :LeaderfMru<cr>

"------------------------------------------------------------------------------
" ALE
"------------------------------------------------------------------------------

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1

let g:ale_sign_column_always = 1

let g:ale_completion_enabled = 1

" ok for jsx can exist in JS files
let g:jsx_ext_required = 0

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=18 ctermfg=red
highlight ALEWarningSign ctermbg=18 ctermfg=yellow

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

"------------------------------------------------------------------------------
" FZF
"------------------------------------------------------------------------------

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }




"---
" Display 256 cterm colors
"---
"let num = 255
"while num >= 0
"    exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
"    exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
"    call append(0, 'ctermbg='.num.':....')
"    let num = num - 1
"endwhile
