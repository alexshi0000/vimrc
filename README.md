"
"
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
"execute pathogen#infect()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  "Plugin 'mhinz/vim-startify' FUCK STARTIFY
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'Yggdroot/indentLine'
  Plugin 'pangloss/vim-javascript'
  Plugin 'haya14busa/incsearch.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'bling/vim-bufferline'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'qpkorr/vim-bufkill'
  Plugin 'itchyny/vim-gitbranch'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'ervandew/supertab'
  Plugin 'octol/vim-cpp-enhanced-highlight'
  Plugin 'kh3phr3n/python-syntax'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/vimshell.vim'
call vundle#end()

filetype plugin on
filetype plugin indent on

"some rules for the layout of this file:
" - each header must be exactly 76 characters long to maintain legibility in
"   a 80 column terminal since the number line actually takes up 4 columns
"
" - after each section there needs to be a 4 space aesthetic gap




"############## Vim Settings ###############################################
autocmd VimResized * redraw!
"remove any possible artificats caused by corrupted buffer, not really a
"problem unless using a bloated plugin and sync vim doesnt know how to
"handle it.

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
set softtabstop=4
set expandtab
set autoindent
set cindent
set ignorecase
set smartcase
set incsearch
set cursorline
set nu
set nowrap
set encoding=UTF-8
set hidden
set foldcolumn=0
set foldmethod=indent
set foldlevelstart=99
set omnifunc=syntaxcomplete#Complete
"set relativenumber
"set showtabline=2
"set ic is to ignore casing for searches
"autocmd BufEnter * silent! lcd %:p:h

"this is where to find swap files
set directory^=$HOME/.vim/tmp//

"change tabstop by file, some files like js and html need 2 spaces
autocmd FileType css        set tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd FileType html       set tabstop=2|set shiftwidth=2|set softtabstop=2

"Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

"retab everything our war, but keep silent in case modify is off
autocmd BufEnter * silent! :retab




"################# Key Mappings ############################################
imap jj <Esc>
imap JJ <Esc>
set timeoutlen=350
"we have to map some keys for the tabs the hidden command allows us to
"leave a buffer hidden without having to save the buffer
map  <C-L> :bnext<CR>
map  <C-H> :bprevious<CR>
nmap <C-C> :BD!
nmap <C-X> :!zsh<CR>
nmap <C-Z> :set hidden<CR>:<C-Z><CR>
"intentionally remove ctrl-z for suspend jobs
"custom copy and paste from and to system clipboard
"this took my so fucking long to get right, you need to
"install vim-gtk
nmap <C-v> "+p
vmap <C-c> "+y




"################# Eye Candy + Syntax Highlighting #########################
syntax on
set t_Co=16
colorscheme base16-tomorrow-night
set background=dark
set fillchars+=vert:▏
let python_highlight_all=1
let g:javascript_plugin_jsdoc=1
"set showtabline=2

" SOME EXTRA HIGHLIGHTING OPTIONS
" here we are going to set something to show trailing whitespaces
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
highlight ExtraWhitespace ctermfg=3 ctermbg=3




"############## NERDTree ###################################################
let g:webdevicons_enable = 0
let g:webdevicons_enable_airline_statusline = 0 "turn off devicons for status bar
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

let NERDTreeStatusline=''
let g:NERDTreeWinSize=28
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
let NERDTreeMinimalUI=1
hi NERDTreeOpenable ctermfg=8
hi NERDTreeClosable ctermfg=7
nnoremap <C-P> :NERDTreeTabsToggle<CR>




"################ Vim Airlines #############################################
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"instead of the above we will simply use :ls and then :b <buffername>
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'
let g:airline_section_b = ' %{gitbranch#name()}'
let g:airlien_section_c = ''
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

"let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n' : 'nrm',
"      \ 'i' : 'ins',
"      \ 'R' : 'rep',
"      \ 'c' : 'cmd',
"      \ 'v' : 'vis',
"      \ 'V' : 'vis',
"      \ '^V' : 'vis',
"      \ 's' : 'sel',
"      \ 'S' : 's-l',
"      \ '^S' : 's-b',
"      \ }




"############# BufferLine ##################################################
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled = 0 "set to 1 in order to enable
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '+'
let g:bufferline_inactive_highlight = 'LineNr'
let g:bufferline_active_highlight = 'Normal'
let g:bufferline_solo_highlight = 0
let g:bufferline_echo = 0
let g:bufferline_pathshorten = 1
let g:bufferline_rotate = 0
let g:bufferline_fname_mod = ':t' "carry leaf name and extention, no path
let g:bufferline_show_bufnr = 0




"############# Indentation Lines ###########################################
let g:indentLine_setColors = 0 "use conceal highlighting
let g:indentLine_char = '▏'
let g:indentLine_conceallevel = 1




"############### Terminal ##################################################
"au TerminalOpen * :setlocal nonu norelativenumber | :AirlineToggle
"au BufLeave * if &buftype == 'terminal' | :AirlineToggle | endif
"au BufEnter * if &buftype == 'terminal' | :AirlineToggle | endif
"do not use the terminal it's experimental and its currently shit




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




"###################### Tagbar #############################################
nmap <F8> :TagbarToggle<CR> :AirlineRefresh<CR>
"the vim airline was broken at the beginning, but I realized after a window
"resize the problems when away, so I set up this airline refresh command for
"tagbar toggle
hi TagbarSignature ctermfg=6 ctermbg=0
hi TagbarComment ctermfg=1 ctermbg=0
"hi TagbarKind ctermfg=7 ctermbg=0
"hi TagbarNestedKind ctermfg=7 ctermbg=0
"hi TagbarType ctermfg=7 ctermbg=0
"hi TagbarScope ctermfg=7 ctermbg=0
"hi TagbarPseudoID ctermfg=7 ctermbg=0
hi TagbarFoldIcon ctermfg=7 ctermbg=0
"hi TagbarHighlight ctermfg=7 ctermbg=0
let g:tagbar_iconchars = ['→ ', '↓ ']
let g:tagbar_left = 0
"let g:tagbar_width = 31




"################## Supertab Completion ####################################
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"




"#################### C / C++ syntax #######################################
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1




"################### VimShell ##############################################
let g:vimshell_prompt = 'Enter a shell command:'
let g:vimshell_use_terminal_command = 'urxvt'
"let g:vimshell_vimshrc_path = '~/.zshrc'




"################# Some Gui Options ########################################
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Terminus\ Medium\ 12
set guioptions+=lrbmTLce
set guioptions-=lrbmTLce
set guioptions+=c
"comment down below for light theme or for gui
"if has('gui_running')
  let g:nerdtree_tabs_open_on_gui_startup = 0
  set t_Co=256

  set background=light
  colorscheme PaperColor
  let g:airline_theme='papercolor'

  nnoremap <C-P> :NERDTreeTabsToggle<CR> :redraw!<CR>
  highlight ExtraWhitespace guifg=yellow guibg=yellow ctermfg=226 ctermbg=226

  let g:airline#extensions#bufferline#enabled = 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
"endif
