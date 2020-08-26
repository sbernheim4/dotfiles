let g:left_sep=""
let g:right_sep=""

function! GetMode()
    let l:mode = mode()
    if l:mode == 'n'
        return 'NORMAL'
    elseif l:mode == 'i'
        return 'INSERT'
    elseif l:mode == 'v'
        return 'VISUAL'
    elseif l:mode == 'c'
        return 'COMMAND'
    else
        return '¯\_(ツ)_/¯'
    endif
endfunction

" Append a `•` to the end of the file name if its been changed and not saved
function! CheckMod(modified)
    if a:modified == 1
        return expand('%:t').'•'
    else
        return expand('%:t')
    endif
endfunction

hi User1 guibg=#424242 guifg=#ffaf00
hi User2 guibg=#1c1c1c guifg=#424242
hi User3 guibg=#1c1c1c guifg=#ebdbb2
hi User4 guibg=#458588 guifg=#1c1c1c
hi User5 guibg=#1c1c1c guifg=#458588

hi User6 guibg=#458588 guifg=#1c1c1c
hi User7 guibg=#404040 guifg=#ebdbb2
hi User8 guibg=#458588 guifg=#404040
hi User9 guibg=#1c1c1c guifg=#458588

function! ActiveLine()
    " Left side of status line
    let statusline = ""
    let statusline .= "%1*"
    let statusline .= " %{GetMode()} "
    let statusline .= "%2*"
    let statusline .= "%{g:left_sep}"
    let statusline .= "%4*"
    let statusline .= "%{g:left_sep}"
    let statusline .= " %{CheckMod(&modified)} "
    let statusline .= "%5*"
    let statusline .= "%{g:left_sep}"

    let statusline .= "%="

    " Right side of status line
    let statusline .= "%9*"
    let statusline .= "%{g:right_sep}"
    let statusline .= "%6*"
    let statusline .= " Ln %l"
    let statusline .= " (%p%%)"
    let statusline .= "%8*"
    let statusline .= " %{g:right_sep}"
    let statusline .= "%7*"
    let statusline .= " Col: %-3c"

    return statusline
endfunction

function! InactiveLine()
    let statusline = ""

    if (has('nvim'))
        let statusline .= "%2*"
    endif

    let statusline .= " %{CheckMod(&modified)} "
    return statusline
endfunction

function! GetMode()
    let l:mode = mode()
    if l:mode == 'n'
        return 'NORMAL'
    elseif l:mode == 'i'
        return 'INSERT'
    elseif l:mode == 'v'
        return 'VISUAL'
    elseif l:mode == 'c'
        return 'COMMAND'
    else
        return '¯\_(ツ)_/¯'
    endif
endfunction

" Change status line automatically when moving between buffers and windows
augroup Statusline
    let ftToIgnore = ['NERDTree']

    autocmd!
    autocmd WinEnter,BufEnter * if index(ftToIgnore, &ft) < 0 | setlocal statusline=%!ActiveLine()
    autocmd WinLeave,BufLeave * if index(ftToIgnore, &ft) < 0 | setlocal statusline=%!InactiveLine()
augroup END
