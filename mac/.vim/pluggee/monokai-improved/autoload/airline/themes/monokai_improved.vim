let g:airline#themes#monokai_improved#palette = {}

" Normal
let s:N1 = ['#F7F9FB', '#545454', 235, 65]
let s:N2 = ['#989a9c', '#363636', 248, 238]
let s:N3 = ['#545454', '#242424', 243, 236]
let g:airline#themes#monokai_improved#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#monokai_improved#palette.normal_modified = {
      \ 'airline_c': ['#F7F9FB', '', 137, '', ''],
      \ }

" Insert
let s:I1 = ['#F7F9FB', '#545454', 235, 67]
let g:airline#themes#monokai_improved#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#monokai_improved#palette.insert_modified =
        \ copy(g:airline#themes#monokai_improved#palette.normal_modified)

" Replace
let s:R1 = ['#F7F9FB', '#545454', 235, 132]
let g:airline#themes#monokai_improved#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
let g:airline#themes#monokai_improved#palette.replace_modified =
        \ copy(g:airline#themes#monokai_improved#palette.normal_modified)

" Visual
let s:V1 = ['#F7F9FB', '#545454', 235, 143]
let g:airline#themes#monokai_improved#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#monokai_improved#palette.visual_modified =
        \ copy(g:airline#themes#monokai_improved#palette.normal_modified)

" Inactive
let s:IA = ['#545454', '#242424', 237, 235, '']
let g:airline#themes#monokai_improved#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#monokai_improved#palette.inactive_modified =
        \ copy(g:airline#themes#monokai_improved#palette.normal_modified)

" Readonly status
let g:airline#themes#monokai_improved#palette.accents = {
      \ 'red': ['#FF5794', '', 132, '']
      \ }

" Ctrlp
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#monokai_improved#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ ['#545454', '#242424', 248, 237, ''],
      \ ['#989a9c', '#363636', 137, 235, ''],
      \ ['#F7F9FB', '#545454', 235, 137, 'bold'])
