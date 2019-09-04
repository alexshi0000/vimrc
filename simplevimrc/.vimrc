" Minimal vimrc for server
" Author: reorx
" Usage:
"     curl -sL https://gist.github.com/reorx/94e18825bc4002268f66/raw -o ~/.vimrc
"     or
"     curl -sL https://gist.github.com/reorx/94e18825bc4002268f66/raw | sudo tee --append /etc/vimrc

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
filetype plugin indent on       " load file type plugins + indentation

"" Tweaks
set hidden                      " allow backgrounding buffers without writing them
set nonumber                    " line numbers aren't needed
if !&scrolloff
  set scrolloff=3               " have some context around the current line always on screen
endif
if &history < 1000
  set history=1000              " remember more Ex commands
endif

" Time out on key codes but not mappings. Makes terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=100

"" Whitespace
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set softtabstop=4

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Have Vim able to edit crontab files again
set backupskip=/tmp/*,/private/tmp/*"

"" Status line
set showcmd                     " display incomplete commands

if has("statusline") && !&cp
  set laststatus=2              " always show the status bar
  set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %p%%
endif

map <C-n> :tabnext<cr>
map <C-p> :tabprevious<cr>


" Below are all from sensible.vim:
" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set complete-=i
set smarttab

set nrformats-=octal

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set ruler
set wildmenu
set lazyredraw

if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread

if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

inoremap <C-U> <C-G>u<C-U>
