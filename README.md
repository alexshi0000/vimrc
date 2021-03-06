```vim
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
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"first install vundle in order to use the plugin manager
call plug#begin('~/.vim/pluggee')
Plug 'sheerun/vim-polyglot'
"Plug 'scrooloose/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree',
Plug 'jistr/vim-nerdtree-tabs',
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'haya14busa/incsearch.vim'
Plug 'majutsushi/tagbar'
Plug 'qpkorr/vim-bufkill'
Plug 'itchyny/vim-gitbranch'
Plug 'ryanoasis/vim-devicons'
Plug 'ervandew/supertab'
"Plug 'kh3phr3n/python-syntax'
"Plug 'lervag/vimtex'
Plug 'noah/vim256-color'
Plug 'tpope/vim-sensible'
"Plug 'vim-python/python-syntax'
Plug 'numirias/semshi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'sainnhe/edge'
Plug 'alvan/vim-closetag'
Plug 'alexshi0000/monokai-improved'
Plug 'uiiaoo/java-syntax.vim'
Plug 'tpope/vim-sleuth'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
"Plug 'python-mode/python-mode'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'alexshi0000/gruvbox'
"Plug 'alexshi0000/vim-deep-space'
"Plug 'jiangmiao/auto-pairs'
"Plug 'bling/vim-bufferline'
Plug 'rking/ag.vim'
Plug 'ap/vim-buftabline'
Plug 'junegunn/goyo.vim'

" the plugins that are grayed out are currently not working

call plug#end()

filetype plugin on
filetype plugin indent on
:set ff=unix

"some rules for the layout of this file:
" - each header must be exactly 76 characters long to maintain legibility in
"   terminal windows
"
" - after each section there needs to be a 2 line gap


"############## Vim Settings ###############################################
"autocmd VimResized * redraw!
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
set norelativenumber

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
autocmd FileType cc             set tabstop=2|set shiftwidth=2 "fucking school assignments use this

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


"################# Lint ####################################################
let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint']
 \ }
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_fix_on_save = 1
let g:ale_enabled = 1


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

"better scrolling for normal mode and also in visual mode
nmap <C-J> 15<C-E>
nmap <C-K> 15<C-Y>
vmap <C-J> 15<C-E>
vmap <C-K> 15<C-Y>

"Ag silver filer searcher settings
nmap <C-F> :Ag! ""


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
nnoremap <C-T> :NERDTreeToggle <CR> :AirlineRefresh <CR>

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


"#################### GOYO #################################################
nmap <C-G> :Goyo <CR>
let g:goyo_width = '60%'
let g:goyo_height = '100%'
function! s:goyo_enter()
      let g:buftabline_show=0
      :call buftabline#update(0)
      set showtabline=0
      redraw!
endfunction

function! s:goyo_leave()
      let g:buftabline_show=2
      :call buftabline#update(0)
      redraw!
      :AirlineRefresh
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


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
let g:airline#extensions#bufferline#enabled = 0 "set to 1 in order to enable
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '+'
let g:bufferline_inactive_highlight = 'Comment'
let g:bufferline_active_highlight = 'Normal'
let g:bufferline_solo_highlight = 0
let g:bufferline_echo = 0
let g:bufferline_pathshorten = 1
let g:bufferline_rotate = 2
let g:bufferline_fname_mod = '%:p:h:t%:t' "carry leaf name and extention, no path
let g:bufferline_show_bufnr = 0
```
