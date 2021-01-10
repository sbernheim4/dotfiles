" ########################################################################
" Custom Functions
" ########################################################################

" Toggle the sign column
function! ToggleSignColumn()
    if &scl == 'no'
        set scl=auto
    else
        set scl=no
    endif
endfunction

" Function to toggle textwidth bar
function! ToggleTextWidth()
    if &colorcolumn == ""
        set colorcolumn=80,120
    else
        set colorcolumn=""
    endif
endfunction

" Toggle relative line numbers
function! ToggleRelativeLineNumbers()
    if (&relativenumber)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" Toggle indenting with tabs and spaces
function! ToggleIndentType()
    if &expandtab == 1
        set noexpandtab
    else
        set expandtab
    endif
endfunction

" Toggle the quickfix menu open and close
function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()

    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor

    let winnr = winnr()

    exec(a:pfx.'open')

    if winnr() != winnr
        wincmd p
    endif

endfunction

" Use CTRL + h/j/k/l to move between buffers instead of CTRL + W + (HJKL)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <LEFT> :2 wincmd <<CR>
nnoremap <RIGHT> :2 wincmd ><CR>
nnoremap <UP> :2 wincmd +<CR>
nnoremap <UP> :2 wincmd +<CR>

" Intuitively navigate wrapped lines. Pressing j/k moves to the next/previous
" line even if wrppaed and the 'next' line is still the same line. Same for 0
" and $
noremap <silent> k gk
noremap <silent> j gj

" ########################################################################
" ######## Toggle Commands
" ########################################################################
"
nnoremap <Leader>sc :call ToggleSignColumn()<CR>
nnoremap <Leader>wr :set wrap!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>t :call ToggleIndentType()<CR>
nnoremap <Leader><Leader>rn :call ToggleRelativeLineNumbers()<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap tw :call ToggleTextWidth()<CR>
nmap <silent> cm :call ToggleList("Quickfix List", 'c')<CR>

" ########################################################################
" ######## Buffer and Window Management
" ########################################################################
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>q :bp <BAR> bd #<CR>

nnoremap <Leader>vp :vsplit<CR>
nnoremap <Leader>hp :split<CR>

nnoremap <Leader>vs :vertical resize +
nnoremap <Leader>hs :resize +

" Move visually selected lines up and down with J and K respectively
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

nnoremap <Leader>ah <C-W>H
nnoremap <Leader>aj <C-W>J
nnoremap <Leader>ak <C-W>K
nnoremap <Leader>al <C-W>L

" ########################################################################
" ######## Miscellaneous
" ########################################################################
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>pwf :echo expand("%p")<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Search for visually selected text using `//` ignoring any reg ex characters
" y will yank the selected text
" / will enter search mode
" \M sets vim to ignore any reg ex characters like * or . and use their literal
" value
" <C-R>" pastes the yanked text into the search bar
" <CR> is enter to execute the search
vnoremap // y/\M<C-R>"<CR>

nnoremap * *N

" Make delimitMate play nicely with pop up menu
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

inoremap jj <ESC> :w<CR>
