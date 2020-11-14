let g:displayTextWidthBarrier=0

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
    if g:displayTextWidthBarrier == 0
        let g:displayTextWidthBarrier=1
        hi ColorColumn guibg=#3a3a3a
	else
        let g:displayTextWidthBarrier=0
        hi ColorColumn guibg=#282828;
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

" ########################################################################
" ######## Navigation
" ########################################################################
" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Use CTRL + h/j/k/l to move between buffers instead of CTRL + W + (HJKL)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <LEFT> :2 wincmd <<CR>
nnoremap <RIGHT> :2 wincmd ><CR>
nnoremap <UP> :2 wincmd +<CR>
nnoremap <UP> :2 wincmd +<CR>

" make wrapped lines more intuitive. Pressing j/k moves to the next/previous
" line even if wrppaed and the 'next' line is still the same line. Same for 0
" and $
noremap <silent> k gk
noremap <silent> j gj

" ########################################################################
" ######## Toggle Commands
" ########################################################################
nnoremap <Leader>sc :call ToggleSignColumn()<CR>
nnoremap <Leader>wr :set wrap!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>t :call ToggleIndentType()<CR>
nnoremap <Leader><Leader>rn :call ToggleRelativeLineNumbers()<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap tw :call ToggleTextWidth()<CR>

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

" Make delimitMateCR play nicely with pop up menu
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

inoremap jj <ESC> :w<CR>
