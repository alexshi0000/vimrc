"
"
"      _    __ ____ __  ___   ______ ____   _   __ ______ ____ ______
"     | |  / //  _//  |/  /  / ____// __ \ / | / // ____//  _// ____/
"     | | / / / / / /|_/ /  / /    / / / //  |/ // /_    / / / / __
"     | |/ /_/ / / /  / /  / /___ / /_/ // /|  // __/  _/ / / /_/ /
"     |___//___//_/  /_/   \____/ \____//_/ |_//_/    /___/ \____/
"
"     - FOR NEOVIM, BY ALEX SHI
"
"
" TODO
"   - dont forget to fork all of the following plugins
"   - make changes to the plugins
"   - change source to my github
"   - need to add the deep-space color scheme
"
" CHANGELOG:
"   - got rid of some dependencies
"   - added terminal key shortcuts
"   - added gruvbox
"   - installed ctrlp for fuzzy file searching
"
"
"################ Plugins ##################################################
"execute pathogen#infect()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"first install vundle in order to use the plugin manager
call vundle#begin()
  Plugin 'scrooloose/nerdtree'
  Plugin 'pangloss/vim-javascript'
  Plugin 'itchyny/vim-gitbranch'
  Plugin 'haya14busa/incsearch.vim'
  Plugin 'bling/vim-bufferline'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'qpkorr/vim-bufkill'
  Plugin 'ervandew/supertab'
  Plugin 'kh3phr3n/python-syntax'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'ap/vim-buftabline'
  Plugin 'alexshi0000/gruvbox'
  Plugin 'majutsushi/tagbar'
  Plugin 'alexshi0000/awesome-vim-colorschemes'
  Plugin 'alexshi0000/vim-deep-space'
  Plugin 'kien/ctrlp.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'rking/ag.vim'
  Plugin 'dkprice/vim-easygrep'
  Plugin 'alexshi0000/monokai-improved'
  "Plugin 'dense-analysis/ale'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-sleuth'
call vundle#end()

filetype plugin on
filetype plugin indent on

"some rules for the layout of this file:
" - each header must be exactly 76 characters long to maintain legibility in
"   terminal windows
"
" - after each section there needs to be a 4 space gap

"############## Vim Settings ###############################################
autocmd VimResized * redraw!
"remove any possible artificats caused by corrupted buffer, not really a
"problem unless using a buggy plugin and sync vim causes some screen
"tearing.

"change the cursor shape (without flickering the screen this time)
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

set guicursor=a:blinkon1 "all blink on1

":cd ~/Documents/workspace
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set wildmenu
set backspace=2
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set cindent
set ignorecase
set smartcase
set incsearch
set cursorline
set nu
set wrap
set encoding=UTF-8
set hidden
set formatoptions-=r
set foldmethod=indent
set foldlevelstart=99
set colorcolumn=80
let &colorcolumn=join(range(81,999),",")
set omnifunc=syntaxcomplete#Complete
set relativenumber
set showtabline=2
"set ic is to ignore casing for searches
"autocmd BufEnter * silent! lcd %:p:h

"keep cursor in the exact same location when leaving or entering buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

"this is where to find swap files
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

"Unbind the cursor keys in insert, normal and visual modes.
"for prefix in ['i', 'n', 'v']
"    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"        exe prefix . "noremap " . key . " <Nop>"
"    endfor
"endfor

"retab everything our way, but keep silent if modify is off
autocmd BufEnter * silent! :retab

" CUSTOM SETTINGS
"change tabstop by file, some files like js and html need 2 spaces
autocmd FileType css        set tabstop=2|set shiftwidth=2|set nowrap
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set nowrap
autocmd FileType html       set tabstop=2|set shiftwidth=2|set nowrap

autocmd FileType java       set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType python     set tabstop=2|set shiftwidth=2|set softtabstop=2|set nowrap
autocmd FileType matlab     set tabstop=4|set shiftwidth=4|set softtabstop=4

autocmd FileType c          set tabstop=8|set shiftwidth=8|set softtabstop=8
autocmd FileType cuda       set tabstop=8|set shiftwidth=8|set softtabstop=8
autocmd FileType cpp        set tabstop=4|set shiftwidth=4|set softtabstop=4

"retab everything our way, but keep silent if modify is off
autocmd BufEnter * silent! :retab

"change working directory to the directory of the current file (when entering
"buffers)
autocmd BufEnter * silent! lcd %:p:h

"ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|\.DS_Store\|\.git'




"################# Key Mappings ############################################
let mapleader=" "
set timeoutlen=350
"we have to map some keys for the tabs the hidden command allows us to
"leave a buffer hidden without having to save the buffer
map  <C-L> :bnext<CR>
map  <C-H> :bprevious<CR>
nmap <C-C> :BD!
nmap <C-X> :above split<Return>:resize 15<Return>:term<CR>i

"intentionally remove ctrl-z for suspend jobs, can use ctrl-z for tmux meta key
nmap <C-Z> :set hidden<CR>:<C-Z><CR>
"custom copy and paste from and to system clipboard
"this took my so fucking long to get right, you need to
"install vim-gtk
nmap <C-v> "+p
vmap <C-c> "+y
nmap <F8> :TagbarToggle<CR>
"this is going to be for ctrlp
nnoremap <C-P> :ctrlp <CR>
nmap <C-J> 5<C-E>
nmap <C-K> 5<C-Y>




"################# Eye Candy + Syntax Highlighting #########################
syntax on
set t_Co=16
colorscheme alduin
set background=dark
" set fillchars+=vert:▎
let python_highlight_all=1
let g:javascript_plugin_jsdoc=1
let g:tagbar_iconchars = ['~ ', '+ ']

" SOME EXTRA HIGHLIGHTING OPTIONS
" here we are going to set something to show trailing whitespaces
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()




"################# Vim Airlines #############################################
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! WhoAmI()
    return system("whoami 2>/dev/null | tr -d '\n'")
endfunction

function! PWD()
    return system("pwd 2>/dev/null | tr -d '\n'")
endfunction

"custom for now
"set statusline=
"set statusline+=\ %{WhoAmI()}
"set statusline+=\ =>
"set statusline+=\ %{GitBranch()}
"set statusline+=/
"set statusline+=%f
"set statusline+=%m
"set statusline+=%=
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ %{&fileformat}
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
"instead of the above we will simply use :ls and then :b <buffername>
let g:airline_powerline_fonts = 1
let g:airline_theme='twofirewatch'
let g:airline_section_b = ' %{gitbranch#name()}'
let g:airline_section_x = ''
let g:airline_section_y = '%{&fileencoding?&fileencoding:&encoding} %{&fileformat}'
let g:airline_section_z = '%y %l:%c'
let g:airline_section_warning = ''

let g:airline_symbols = {}

"unicode symbols
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_exclude_preview = 0 "remove known bug with nerdtree previews
let g:airline#extensions#default#section_truncate_width = {
            \ 'a': 0,
            \ 'b': 0,
            \ 'x': 0,
            \ 'y': 0,
            \ 'z': 0,
            \ }




"############## Status Line #################################################
set laststatus=2
" Name of the current branch (needs fugitive.vim)
set statusline +=\ [%{gitbranch#name()}]
" Date of the last time the file was saved
set statusline +=\ %{strftime(\"[%d/%m/%y\ %T]\",getftime(expand(\"%:p\")))}
" Line, column and percentage
set statusline +=%=%-14.(%l,%c%V%)\ %P




"############## NERDTree ###################################################
let g:webdevicons_enable = 0
let g:webdevicons_enable_airline_statusline = 0 "turn off devicons for status bar
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let NERDTreeStatusline=''
let g:NERDTreeWinSize=30
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeDirArrowExpandable = '~'
let g:NERDTreeDirArrowCollapsible = '+'
let NERDTreeMinimalUI=1
nnoremap <C-T> :NERDTreeToggle <CR>




"############# BufferLine ##################################################
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled = 0 "set to 1 in order to enable
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '+'
let g:bufferline_inactive_highlight = 'LineNr'
let g:bufferline_solo_highlight = 0
let g:bufferline_echo = 0
let g:bufferline_pathshorten = 1
let g:bufferline_rotate = 0
let g:bufferline_fname_mod = ':t' "carry leaf name and extention, no path
let g:bufferline_show_bufnr = 0




"#################### INC Search ###########################################
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"for some more searching goodness
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)




"################## Supertab Completion ####################################
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"not to be confused with <c-n> or <c-p> which uses tags from files,
"directories, etc. Omnicompletion is language-specific
