" vim-airline companion theme of wombat
" looks great with wombat256 vim colorscheme

let g:black = '#000000'
let g:white = '#FFFFFF'
let g:gray = '#444444'
let g:gray_2 = '262626'
let g:gray_3 = '#727272'

let g:yellow = '#E9A810'
let g:green = '#0cb267'
let g:blue = '#007aa3'
let g:red = '#E5786D'

let g:inactive = '#b7b7b7'

" Normal mode
"          [ guifg,   guibg, ctermfg, ctermbg, opts ]
let s:N1 = [ black ,  yellow, 232 , 192 ] " mode
let s:N2 = [ yellow,  gray,   192 , 238 ] " info
let s:N3 = [ white ,  gray_2, 192 , 235 ] " statusline
let s:N4 = [ yellow , 113 ]               " mode modified

" Insert mode
let s:I1 = [ black , green,  232 , 227 ]
let s:I2 = [ green , gray,   227 , 238 ]
let s:I3 = [ white , gray_2, 227 , 235 ]
let s:I4 = [ green , 221 ]

" Visual mode
let s:V1 = [ black, blue,   232, 153 ]
let s:V2 = [ blue,  gray,   153, 238 ]
let s:V3 = [ white, gray_2, 153, 235 ]
let s:V4 = [ blue , 111 ]

" Replace mode
let s:R1 = [ black, red,    232, 173 ]
let s:R2 = [ red,   gray,   173, 238 ]
let s:R3 = [ white, gray_2, 173, 235 ]
let s:R4 = [ red, 203 ]

" Paste mode
let s:PA = [ '#94E42C' , 47 ]

" Info modified
let s:IM = [ '#40403C' , 238 ]

" Inactive mode
"          [ guifg,     guibg,   ctermfg, ctermbg, opts ]
let s:IA = [ inactive, s:N3[1], 243,     s:N3[3], ''   ]

let g:airline#themes#wombat#palette = {}

let g:airline#themes#wombat#palette.accents = {
      \ 'red': [ '#E5786D' , '' , 203 , '' , '' ],
      \ }


let g:airline#themes#wombat#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
"                  [ guifg,    guibg,    ctermfg,  ctermbg,  opts   ]
let g:airline#themes#wombat#palette.normal_modified = {
    \ 'airline_a': [ s:N1[0], s:N4[0], s:N1[2], s:N4[1], '' ] ,
    \ 'airline_b': [ s:N2[0], s:IM[0], s:N4[1], s:IM[1], '' ] ,
    \ 'airline_c': [ s:N1[0], gray_3,  s:N4[1], s:N3[3], '' ] }


let g:airline#themes#wombat#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#wombat#palette.insert_modified = {
    \ 'airline_a': [ s:I1[0], s:I4[0], s:I1[2], s:I4[1], '' ] ,
    \ 'airline_b': [ s:I2[0], s:IM[0], s:I4[1], s:IM[1], '' ] ,
    \ 'airline_c': [ s:I1[0], gray_3,  s:I4[1], s:N3[3], '' ] }


let g:airline#themes#wombat#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#wombat#palette.visual_modified = {
    \ 'airline_a': [ s:V1[0], s:V4[0], s:V1[2], s:V4[1], '' ] ,
    \ 'airline_b': [ s:V2[0], s:IM[0], s:V4[1], s:IM[1], '' ] ,
    \ 'airline_c': [ s:V1[0], gray_3,  s:V4[1], s:N3[3], '' ] }


let g:airline#themes#wombat#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#wombat#palette.replace_modified = {
    \ 'airline_a': [ s:R1[0], s:R4[0], s:R1[2], s:R4[1], '' ] ,
    \ 'airline_b': [ s:R2[0], s:IM[0], s:R4[1], s:IM[1], '' ] ,
    \ 'airline_c': [ s:R1[0], gray_3,  s:R4[1], s:N3[3], '' ] }


let g:airline#themes#wombat#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#wombat#palette.inactive_modified = {
    \ 'airline_c': [ gray_3, '', s:N4[1], '', '' ] }
