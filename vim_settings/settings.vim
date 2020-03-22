" Don't wrap lines by default
set nowrap

" When wrapping text, do so appropriately (don't wrap in the middle of the word)
set linebreak

" Highlight the current cursor line
set cursorline

" Shows line numbers by default when opening files
set number

" Shows relative line numbers by default
set relativenumber

" Indent wrapped lines for easier separation
set breakindent

" Displays the special characters like eol, indents etc.
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set list
set listchars=tab:\|\ ,
set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensitive
set ignorecase
set smartcase

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

" Search as you type (NOTE: enabled by default in neovim)
set incsearch

" ************** Custom Highlight Groups **************

" Set color for vertical bar for the color column
hi ColorColumn guibg=#3a3a3a

" Set background for vertical vim split
hi vertsplit guifg=#1d1d1d guibg=#1d1d1d

" Highlight color for the cursor line
hi CursorLine guibg=#3d3d3d

" ****************** Tabs and Spaces ******************
" Set the tab stop to 4
set tabstop=4

" Helps with auto indenting when using =
set shiftwidth=4

" Indent with spaces by default - only due to work :(
set expandtab

set laststatus=2
set noshowmode
set showtabline=0

set scl=no
