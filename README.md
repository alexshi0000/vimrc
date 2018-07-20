# vimrc
files for my vim config. first thing to do when ssh into a new server. 
<br>
```Vim script
"
"      _    __ ____ __  ___   ______ ____   _   __ ______ ____ ______
"     | |  / //  _//  |/  /  / ____// __ \ / | / // ____//  _// ____/
"     | | / / / / / /|_/ /  / /    / / / //  |/ // /_    / / / / __
"     | |/ /_/ / / /  / /  / /___ / /_/ // /|  // __/  _/ / / /_/ /
"     |___//___//_/  /_/   \____/ \____//_/ |_//_/    /___/ \____/
"
"
"################ Plugins ##################################################
execute pathogen#infect()
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
call plug#end()



"############## Vim Settings ###############################################
set mouse=
set showmode
set tabstop=4
set softtabstop=4
set autoindent
set cindent
set shiftwidth=4
set cursorline
set nu
set nowrap
set encoding=UTF-8
set foldcolumn=0
set foldmethod=indent
set foldlevelstart=99
set directory^=$HOME/.vim/tmp//
"this is where to find swap files
for prefix in ['i', 'n', 'v']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor
"Unbind the cursor keys in insert, normal and visual modes.
"set relativenumber
"set showtabline=2
"set ic
"set ic is to ignore casing for searches
"autocmd BufEnter * silent! lcd %:p:h




"################# Key Mappings ############################################
imap jj <Esc>
imap JJ <Esc>
set timeoutlen=350
"we have to map some keys for the tabs the hidden command allows us to leave a
"buffer hidden without having to save the buffer
map <C-K> :set hidden<CR>:bnext<CR>
map <C-J> :set hidden<CR>:bprevious<CR>
nmap <C-X> :!zsh<CR>
"nnoremap <C-E> :tabe 

"custom copy and paste from and to system clipboard
"this took my so fucking long to get right, you need to
"install vim-gtk
nmap <C-v> "+p
vmap <C-c> "+y




"################# Eye Candy ###############################################
"let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256
syntax enable
set background=dark
colorscheme base16-tomorrow-night

let python_highlight_all=1
let g:javascript_plugin_jsdoc=1
"set showtabline=2

" highlighting for fuzzy file finder (DO NOT CHANGE)
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Function'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Repeat'],
  \ 'fg+':     ['fg', 'CursorColumn', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorColumn', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" for other highlighting settings are going to be in the color scheme
" here we are going to set something to show trailing whitespaces
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()




"########### Fuzzy File Searcher ###########################################
set rtp+=~/.fzf
map <C-F> :set hidden<CR>:FZF ~<CR>
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }



"############## NERDTree ###################################################
nnoremap <C-P> :NERDTreeTabsToggle<CR>
let g:webdevicons_enable = 0
let g:webdevicons_enable_airline_statusline = 0 "turn off devicons for status bar
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

"change nerdtree arrow colors
hi NERDTreeOpenable ctermfg=15
hi NERDTreeClosable ctermfg=5

let NERDTreeStatusline=''
let g:NERDTreeWinSize=35
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
"this piece of code below is extremely important
"set nocursorline
"augroup NerdCursor
"	autocmd!
"	autocmd WinEnter NERD_tree_* setlocal cursorline
"	autocmd WinLeave NERD_tree_* setlocal nocursorline
"	autocmd BufEnter NERD_tree_* setlocal cursorline
"	autocmd BufLeave NERD_tree_* setlocal nocursorline
"augroup END

"let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'hpp', 'cpp', 'py', 'R', 'html', 'sh', 'mat', 'png', 'img', 'jpg', 'php', 'rb', 'js', 'css', 'txt']

"neobundle
"set runtimepath+=~/.vim/bundle/neobundle.vim/
"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
"call neobundle#end()
"filetype plugin indent on
"NeoBundleCheck



"################ Vim Airlines #############################################
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"instead of the above we will simply use :ls and then :b <buffername>
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'
let g:airline_section_b = ' %{gitbranch#name()}'
let g:airlien_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = '%{&fileencoding?&fileencoding:&encoding} %{&fileformat}'
let g:airline_section_z = '%y %l:%c'
let g:airline_section_warning = ''

let g:airline#extensions#default#section_truncate_width = {
	  \ 'a': 70,   
      \ 'b': 60,
      \ 'x': 50,
      \ 'y': 60,
      \ 'z': 70,
      \ }
```
