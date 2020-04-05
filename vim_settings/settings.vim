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

" Persist undo even after vim/neovim is closed and reopened
set undofile

" Have vim splits open on the right and on the bottom by default
set splitbelow
set splitright

" Start scrolling when you hit 10 lines above or below the buffer start/end
set scrolloff=4

" Write on :next/:prev/^Z
set autowrite


set signcolumn=auto

" ****************** LINE WRAPPING ******************
" Don't wrap lines by default
set nowrap

" Indent wrapped lines for easier separation
set breakindent

" When wrapping text, do so appropriately (don't wrap in the middle of the word)
set linebreak

set breakindentopt=shift:2,sbr

" ****************** SEARCH SETTINGS ******************
" If search string contains only lowercase letters search is case insensitive.
set ignorecase

" If search string contains capital letters search is case sensitive
set smartcase

" Search as you type (NOTE: enabled by default in neovim)
set incsearch

" ****************** UNDO INFO ******************
set undodir=~/.vim/undo-dir
set undofile

" ****************** LIST CHARACTERS ******************

" Displays the special characters like eol, indents etc.
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set list
set listchars=tab:\|\ ,
set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,

" ****************** TABS AND SPACES ******************
" Set the tab stop to 4
set tabstop=4

" Helps with auto indenting when using =
set shiftwidth=4

" Indent with spaces by default - only due to work :(
set expandtab

" ******************** TAB AND STATUS LINE ********************
" Always show status line
set laststatus=2

" Hide tabline
set showtabline=0

" Don't display mode changes in command line (displayed in status line)
set noshowmode

" ******************** FOLDING ********************
" Fold based off of syntax highlighting
set foldmethod=syntax

" Don't set the fold column
set foldcolumn=0

" Open files without any folding
set foldlevelstart=99

" Enable folding for JS syntax
let javaScript_fold=1

" Convert indentation level of the line being folded to spaces
function! GetSpaces(name)
    let spacing = ''
    let spaceAmount = ''

    if &noexpandtab
        let spaceAmount = '      '
    else
        let spaceAmount = ''
    endif

    for i in range(1, len(a:name))
        let spacing = foo . spaceAmount
    endfor

    return spacing
endfunction

function! MyFoldText()
    let startLine = getline(v:foldstart)
    let endLine = getline(v:foldend)
    let indentLevel = indent(v:foldstart)
    let spaces = GetSpaces(indentLevel)

    let total = spaces . startLine . endLine

    return total
endfunction

" Custom display for text when folding
set foldtext=MyFoldText()

" ******************** CUSTOM HIGHLIGHT GROUPS ********************
" Set color for vertical bar for the color column
hi ColorColumn guibg=#3a3a3a

" Set background for vertical vim split
hi vertsplit guifg=#1d1d1d guibg=#1d1d1d

" Highlight color for the cursor line
hi CursorLine guibg=#3d3d3d

