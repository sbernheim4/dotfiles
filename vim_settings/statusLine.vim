" Status Line

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

function! CheckMod(modi)
    if a:modi == 1
        hi Modi guifg=#efefef guibg=#212333 gui=bold
        hi Filename guifg=#efefef guibg=#212333
        return expand('%:t').'*'
    else
        hi Modi guifg=#929dcb guibg=#212333 gui=bold
        hi Filename guifg=#929dcb guibg=#212333
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
    let statusline .= "%2*"
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

" Change status line automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END
