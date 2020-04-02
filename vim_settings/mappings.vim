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

" Just like windo, but restore the current window when done - https://vim.fandom.com/wiki/Windo_and_restore_current_window
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction

" Toggle cursor line highlight for all windows
nnoremap <Leader>cll :call WinDo('set cursorline!')<CR>

" Create a new buffer
nnoremap <Leader>b :enew<CR>

" Move to the next buffer
noremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Split the current window vertically or horizontally (Useful when you want to have the same file open at two different
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

" Don't jump to the next occurrence automatically when searching via *
nnoremap * *N

" Use CTRL + h/j/k/l to move between buffers instead of CTRL + W + (HJKL)
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

" make wrapped lines more intuitive. Pressing j/k moves to the next/previous
" line even if wrppaed and the 'next' line is still the same line. Same for 0
" and $
noremap <silent> k gk
noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$

" Toggle folds with space key in normal and visual mode
nnoremap <Space> za
vnoremap <Space> za
