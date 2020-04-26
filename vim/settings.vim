" Highlight the current cursor line
set cursorline

" Display line numbers by default
set number

" Use relative line numbers by default
set relativenumber

" Use utf8 as the encoding format for files
set encoding=utf8

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Have vim splits open on the right and on the bottom by default
set splitbelow
set splitright

" Start scrolling when you hit 10 lines above or below the buffer start/end
set scrolloff=4

" Write on :next/:prev/^Z
set autowrite

set signcolumn=auto

" ########################################################################
" ######## Line Wrapping
" ########################################################################
" Don't wrap lines by default
set nowrap

" Indent wrapped lines for easier separation
set breakindent

" When wrapping text, do so appropriately (don't wrap in the middle of the word)
set linebreak

set breakindentopt=shift:2,sbr

" ########################################################################
" ######## Search Settings
" ########################################################################
" If search string contains only lowercase letters search is case insensitive.
set ignorecase

" If search string contains capital letters search is case sensitive
set smartcase

" Search as you type (NOTE: enabled by default in neovim)
set incsearch

" Use rg when calling :grep
set grepprg=rg\ --vimgrep

" ########################################################################
" ######## Undo Info
" ########################################################################
set undodir=~/.vim/undo-dir

" Persist undo even after vim/neovim is closed and reopened
set undofile

" ########################################################################
" ######## List Characters
" ########################################################################
" Displays the special characters like eol, indents etc.
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set list
set listchars=tab:\|\ ,
set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,

set fillchars+=vert:█

" ########################################################################
" ######## Tabs and Spaces
" ########################################################################
" Set the tab stop to 4
set tabstop=4

" Helps with auto indenting when using =
set shiftwidth=4

" Indent with spaces by default - only due to work :(
set expandtab

" ########################################################################
" ######## Status Line"
" ########################################################################
" Always show status line
set laststatus=2

" Hide tabline
set showtabline=0

" Don't display mode changes in command line (displayed in status line)
set noshowmode

" #######################################################################
" ######## Folding
" ########################################################################
" Fold based off of syntax highlighting
set foldmethod=syntax

" Don't set the fold column
set foldcolumn=0

" Open files without any folding
set foldlevelstart=99

" Enable folding for JS syntax
let javaScript_fold=1

function! MyFoldText()
    let startLine = getline(v:foldstart)
    let endLine = getline(v:foldend)

    let l:spaces = ""
    if g:use_tabs==0
        let l:spaces = repeat (" ", v:foldlevel / 4)
    else
        let l:spaces = repeat("  ", v:foldlevel) . "  "
    endif

    let total = l:spaces . startLine . endLine
    return total
endfunction

" Custom display for text when folding
set foldtext=MyFoldText()

" ########################################################################
" ######## Custom Highlight Groups
" ########################################################################
" Set color for vertical bar for the color column
hi ColorColumn guibg=#3a3a3a

" Set background for vertical vim split
hi vertsplit guifg=#c4ab97 guibg=#c4ab97

" Highlight color for the cursor line
hi CursorLine guibg=#3d3d3d

hi SignColumn guibg=#282828

" From https://github.com/knubie/dotfiles/blob/fe7967f875945e54d49fc672f575c47691a1e4cc/.vimrc#L136
augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()

    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline

augroup END

function! ResizeSplits()
    if &ft == 'nerdtree'
        return
    elseif &ft == 'qf'
        set winheight=10
        return
    else
        set winwidth=85
        wincmd =
    endif
endfunction
