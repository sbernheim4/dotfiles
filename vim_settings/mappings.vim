""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>

" Toggle highlighting of search results
nnoremap <Leader>hl :set hlsearch!<CR>

" Toggle cursor line highlight
nnoremap <Leader>cll :set cursorline!<CR>

" Create a new buffer
nnoremap <Leader>b :enew<CR>

" Move to the next buffer
noremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Split the curent window vertically or horizontally (Useful when you want to have the same file open at two different
" locations at the same time)
nnoremap <Leader>vsp :vsplit<CR>
nnoremap <Leader>hsp :split<CR>

" Vertically and horizontally resize a window
nnoremap <Leader>vrs :vertical resize +
nnoremap <Leader>hrs :resize +

nnoremap <Leader>r :source ~/.vimrc<CR>

" Display the path of the current file
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

" Function to toggle textwidth bar
function! ToggleTextWidth()
    " if the textwidth is not set and the width is greater than 120 chars
    if (&textwidth == 0)
        set textwidth=120
        set colorcolumn=+1
    else
        set textwidth=0
    endif
endfunction

nnoremap <silent> tw :call ToggleTextWidth()<CR>

function! ToggleRelativeLineNumbers()
    if (&relativenumber)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

nnoremap <silent>rn :call ToggleRelativeLineNumbers()<CR>

" Use zz to place current line n lines above the center
" nnoremap zz zt5<C-y>

" Don't jump to the next occurance automatically when searching via *
nnoremap * *N zz

" Use CTRL + h/j/k/l to move between buffers
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

function! ToggleIndentType()
    if !exists("g:use_tabs") || g:use_tabs
        " Indent with SPACES instead of tabs
        set expandtab
        let g:use_tabs=0
    else
        " Indent with TABS instead of spaces
        set noexpandtab
        let g:use_tabs=1
    endif
endfunction

nmap <Leader><Leader>t :call ToggleIndentType()<CR>

" nnoremap j jzz
" nnoremap k kzz
