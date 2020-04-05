"
"
"      _    __ ____ __  ___   ______ ____   _   __ ______ ____ ______
"     | |  / //  _//  |/  /  / ____// __ \ / | / // ____//  _// ____/
"     | | / / / / / /|_/ /  / /    / / / //  |/ // /_    / / / / __
"     | |/ /_/ / / /  / /  / /___ / /_/ // /|  // __/  _/ / / /_/ /
"     |___//___//_/  /_/   \____/ \____//_/ |_//_/    /___/ \____/
"
"
"
"
"################ Plugins ##################################################
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"first install vundle in order to use the plugin manager
call vundle#begin()
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'pangloss/vim-javascript'
Plugin 'haya14busa/incsearch.vim'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'itchyny/vim-gitbranch'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ervandew/supertab'
Plugin 'kh3phr3n/python-syntax'
Plugin 'lervag/vimtex'
Plugin 'noah/vim256-color'
Plugin 'tpope/vim-sensible'
Plugin 'numirias/semshi'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'davidosomething/vim-colors-meh'
Plugin 'sainnhe/edge'
Plugin 'alvan/vim-closetag'
Plugin 'alexshi0000/monokai-improved'
Plugin 'uiiaoo/java-syntax.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'leafgarland/typescript-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
"Plugin 'python-mode/python-mode'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'alexshi0000/gruvbox'
"Plugin 'alexshi0000/vim-deep-space'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'bling/vim-bufferline'
"Plugin 'ap/vim-buftabline'
"Plugin 'rafalbromirski/vim-aurora'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'joshdick/onedark.vim'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'plainfingers/black_is_the_color'
"Plugin 'AlessandroYorba/Sierra'
"Plugin 'ayu-theme/ayu-vim'
"Plugin 'cocopon/iceberg.vim'
"Plugin 'alexshi0000/nord-vim'
"Plugin 'AlessandroYorba/Alduin'
"Plugin 'tyrannicaltoucan/vim-quantum'
"Plugin 'haishanh/night-owl.vim'

call vundle#end()

filetype plugin on
filetype plugin indent on
:set ff=unix

"some rules for the layout of this file:
" - each header must be exactly 76 characters long to maintain legibility in
"   terminal windows
"
" - after each section there needs to be a 2 line gap


"############## Vim Settings ###############################################
autocmd VimResized * redraw!
"remove any possible artificats caused by corrupted buffer, not really a
"problem unless using a buggy plugin and sync vim causes some screen
"tearing.

"change the cursor shape (without flickering the screen this time)
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

":cd ~/Documents/workspace
set wildmenu
set backspace=2
set mouse=a
set tabstop=4
set shiftwidth=4
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
set foldcolumn=0
set foldmethod=indent
set foldlevelstart=99
set colorcolumn=80
let &colorcolumn=join(range(81,999),",")
set omnifunc=syntaxcomplete#Complete
set relativenumber

"set tabline=2

"keep cursor in the exact same location when leaving or entering buffers
if v:version >= 700
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp/

set formatoptions-=r
set formatoptions-=o

"change tabstop by file, some files like js and html need 2 spaces
autocmd FileType css            set tabstop=2|set shiftwidth=2
autocmd FileType javascript     set tabstop=2|set shiftwidth=2
autocmd FileType php            set tabstop=2|set shiftwidth=2
autocmd FileType html           set tabstop=2|set shiftwidth=2|set nowrap "html is known to be long, so don't wrap
autocmd FileType typescript.tsx set tabstop=2|set shiftwidth=2|set nowrap "tsx is known to be long, so don't wrap

autocmd FileType java           set tabstop=4|set shiftwidth=4
autocmd FileType python         set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4 "use spaces for python
autocmd FileType cpp            set tabstop=4|set shiftwidth=4
autocmd FileType ruby           set tabstop=4|set shiftwidth=4
autocmd FileType go             set tabstop=4|set shiftwidth=4

autocmd FileType c              set tabstop=8|set shiftwidth=8 "linux kernel standard
autocmd FileType cuda           set tabstop=8|set shiftwidth=8 "^

"ctrlp ignore certain files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|venv'

"closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx"


"################# Easy Retabing ###########################################
map <F9> gg=G<C-o><C-o>


"################# Key Mappings ############################################
set timeoutlen=275
"we have to map some keys for the tabs the hidden command allows us to
"leave a buffer hidden without having to save the buffer
map  <C-L> :bnext<CR>
map  <C-H> :bprevious<CR>
nmap <C-C> :BD!
nmap <C-X> :!zsh<CR>

"intentionally remove ctrl-z for suspend jobs, can use ctrl-z for tmux meta key
nmap <C-Z> :set hidden<CR>:<C-Z><CR>
"custom copy and paste from and to system clipboard
nmap <C-v> "+p
vmap <C-c> "+y

nmap <C-b> :buffers<CR>:b

"better scrolling
nmap <C-J> 15<C-E>
nmap <C-K> 15<C-Y>


"################ Eye Candy ################################################
syntax on
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=light
colorscheme monokai-improved

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:blinkwait1

let g:python_highlight_all=1
let g:javascript_plugin_jsdoc=1
let g:cpp_member_variable_highlight = 1
let g:tagbar_iconchars = ['~ ', '+ ']

"syntax breaking fix
autocmd BufEnter * :syntax sync fromstart

"set listchars=tab:│\ ,eol:⌝
"set list

" SOME EXTRA HIGHLIGHTING OPTIONS
" here we are going to set something to show trailing whitespaces
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"############### NERDtree #################################################
let g:webdevicons_enable = 0
let g:webdevicons_enable_airline_statusline = 0 "turn off devicons for status bar
let g:airline#extensions#ale#enabled = 0
let g:ale_completion_enabled = 1
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let NERDTreeStatusline=''
let g:NERDTreeWinSize=27
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeDirArrowExpandable = '~'
let g:NERDTreeDirArrowCollapsible = '+'
let NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']

"toggle back to refresh for errors
nnoremap <C-T> :NERDTreeToggle <CR> :AirlineToggle <CR> :AirlineToggle <CR>

:set fillchars+=vert:\▏


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


"################ Vim Airlines #############################################
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

let g:airline_mode_map = {
      \ '__'     : '###',
      \ 'c'      : '</>',
      \ 'i'      : '->>',
      \ 'ic'     : '=>>',
      \ 'ix'     : '=>>',
      \ 'n'      : '-->',
      \ 'multi'  : '===',
      \ 'ni'     : '-->',
      \ 'no'     : '-->',
      \ 'R'      : '<--',
      \ 'Rv'     : '<<-',
      \ 's'      : '***',
      \ 'S'      : '***',
      \ ''     : '***',
      \ 't'      : '~~>',
      \ 'v'      : '<->',
      \ 'V'      : '<=>',
      \ ''     : '<=>',
      \ }

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
"instead of the above we will simply use :ls and then :b <buffername>
let g:airline_powerline_fonts = 1
let g:airline_theme='monokai_improved'
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


"############# BufferLine ##################################################
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled = 1 "set to 1 in order to enable
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '+'
let g:bufferline_inactive_highlight = 'Comment'
let g:bufferline_active_highlight = 'Normal'
let g:bufferline_solo_highlight = 0
let g:bufferline_echo = 0
let g:bufferline_pathshorten = 1
let g:bufferline_rotate = 0
let g:bufferline_fname_mod = ':t' "carry leaf name and extention, no path
let g:bufferline_show_bufnr = 0
