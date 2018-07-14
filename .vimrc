execute pathogen#infect()
filetype plugin indent on

"======> identation settings go here
set tabstop=4
set softtabstop=4
set autoindent
set cindent
set shiftwidth=4
set cursorline

"===> for web programming we can set the tabstop to 2

"======> ide-like plugins go here
"set nu
"set relativenumber
"set showtabline=2
"autocmd BufEnter * silent! lcd %:p:h "this changes the working dir to be the same as the one in the file

"=======> this is going to be a fuzzy file searcher
set rtp+=~/.fzf
map <C-F> :set hidden<CR>:FZF ~<CR>
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }
"<======= this fuzzy file searching mapping will always start searching from root (~)

set nowrap
set encoding=UTF-8
set foldcolumn=0
nnoremap <C-P> :NERDTreeTabsToggle<CR>
set foldmethod=indent
set foldlevelstart=99

let g:webdevicons_enable = 0
let g:webdevicons_enable_airline_statusline = 0 "turn off devicons for status bar
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
"this piece of code below is extremely important
set nocursorline
augroup NerdCursor
	autocmd!
	autocmd WinEnter NERD_tree_* setlocal cursorline
	autocmd WinLeave NERD_tree_* setlocal nocursorline
	autocmd BufEnter NERD_tree_* setlocal cursorline
	autocmd BufLeave NERD_tree_* setlocal nocursorline
augroup END

"Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor

"let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'hpp', 'cpp', 'py', 'R', 'html', 'sh', 'mat', 'png', 'img', 'jpg', 'php', 'rb', 'js', 'css', 'txt']

"neobundle
"set runtimepath+=~/.vim/bundle/neobundle.vim/
"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
"call neobundle#end()
"filetype plugin indent on
"NeoBundleCheck

"======> color scheme settins go here
"let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256
syntax enable
set background=dark
colorscheme base16-solarized-light

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
"======> for other highlighting settings are going to be in the color scheme

"======> here we are going to set something to show trailing whitespaces
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"======> mapping some keys
imap jj <Esc>
imap JJ <Esc>
set timeoutlen=350
"we have to map some keys for the tabs the hidden command allows us to leave a
"buffer hidden without having to save the buffer
map <C-K> :set hidden<CR>:bnext<CR>
map <C-J> :set hidden<CR>:bprevious<CR>
"nnoremap <C-E> :tabe 

"======> lets go ahead and get a statusbar
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

let NERDTreeStatusline=''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_solarized'
let g:airline_section_b = ' %{gitbranch#name()}'
let g:airlien_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = '%{&fileencoding?&fileencoding:&encoding} %{&fileformat}'
let g:airline_section_z = '%y %l:%c'
let g:airline_section_warning = ''


let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 79,
      \ 'x': 60,
      \ 'y': 79,
      \ 'z': 45,
      \ }

set showmode

"======> misc
set mouse=

"custom copy and paste from and to system clipboard
"this took my so fucking long to get right, you need to
"install vim-gtk
nmap <C-v> "+p
vmap <C-c> "+y

"changing vim behaviour (only slightly)
set ic
