""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Next generation completion framework after neocomplcache
Plug 'Shougo/deoplete.nvim'

" Dependency for vimfiler
Plug 'Shougo/unite.vim'

" A tree explorer plugin for vim.
Plug 'Shougo/vimfiler'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Command-line fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" 🔗  The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" Vim plugin that displays tags in a window, ordered by scope
" NOTE: Requires ctags to be installed to do so, run the following from ~/
" 1. run `brew install ctags`
" 2. run `which ctags` if the result is /usr/bin/ctags it means you are not
" 	 using the brew version
" 3. run `PATH=/usr/local/bin:$PATH`
" 4. run `which ctags` if the result is /usr/local/bin/ctags you are using
" 	 brew's version
Plug 'majutsushi/tagbar'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" 🔣 Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Quantify your coding inside Vim.
Plug 'wakatime/vim-wakatime'

" Vastly improved Javascript indentation and syntax support in Vim. https://www.vim.org/scripts/script.php?script_id=4452
Plug 'pangloss/vim-javascript'

" JSX syntax highlighting
Plug 'mxw/vim-jsx'

" True Sublime Text style multiple selections for Vim
" Plug 'terryma/vim-multiple-cursors'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the Leader key , instead of the default \
let mapleader=","

syntax enable
syntax on
set t_Co=256

set background=dark " for the dark version
colorscheme gruvbox



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight the current cursor line
set cursorline

" Wrap text on the screen appropriately (don't wrap in the middle of the word)
set linebreak

" Shows line numbers by default when opening files
set number

" Shows relative line numbers
set relativenumber

" Set the tab stop to 4
set tabstop=4
"
" Helps with autoindenting when using =
set shiftwidth=4

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Have line wrapping off by default
set nowrap

" Displays the special characters like eol, indents etc
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set listchars=tab:\|\ ,
set listchars=tab:•\ ,
" set listchars=tab:•\ ,eol:¬
set list

" Hide the default mode indicator. Do so because airline will show the current mode
set noshowmode

" Display vim airline at the botom of the window
set laststatus=2

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

set encoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode
nnoremap <Leader>a :set paste!<CR>

" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>

" Toggle highlighting of search results
nnoremap <Leader>hl :set hlsearch!<CR>

" Toggle cursor line highlight
nnoremap <Leader>cll :set cursorline!<CR>

" Unbinds the arrow keys and makes them stop working
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" SETTINGS FOR THE BUFFER
" Create a new buffer
nnoremap <Leader>b :enew<cr>

" Move to the next buffer
nnoremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status --> Unnecessary since I am displaying open buffers at the top using airline
" nnoremap <Leader>bl :ls<CR>

" Split the curent window vertically or horizontally (Useful when you want to have the same file open at two different locations at the same time)
nnoremap <Leader>sp :vsplit<CR>
nnoremap <Leader>hsp :split<CR>

" Vertically resize a window
nnoremap <Leader>vrs :vertical resize

" Use tt to togle the tagbar open and close
nnoremap tt :TagbarToggle<CR>

" Use fzf to open files --> Alternative to Ctrl-P
" Toggles NERDTree and then opens fzf window to find file so new file isn't
" opened in the NERDTree space --> ONLY WORKS THIS WAY IF NERDTree is already
" open and file is opened in a new buffer
" nnoremap nff :NERDTreeToggle<CR> :Files<CR>

" Opens fzf window without toggling NERDTree
nnoremap ff :Files<CR>
nnoremap <c-f> :Ag<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS TO MODIFY SPECIFIC  PACKAGES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" #########################
" ###### Deocomplete
" ########################

let g:deoplete#enable_at_startup = 1

" Use tab to auto cycle through autocmoplete list instead of arrows
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"



" #########################
" ###### VimFiler
" ########################

let g:vimfiler_tree_opened_icon = '▿'
let g:vimfiler_tree_closed_icon = '▸'

noremap <Leader>d :VimFilerExplorer<CR>
nmap <Leader>i <Plug>(vimfiler_toggle_visible_dot_files)



" #########################
" ###### NerdCommenter
" ########################
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



" #########################
" ###### EasyMotion
" ########################

" Run easymotion commands in a direction --> based off of hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)



" #########################
" ###### Airline
" ########################

" Using the font Meslo LG S Regular for Powerline which can be found here:
" https://github.com/powerline/fonts/tree/master/Meslo
" Currently using DejaVu Sans Mono for Powerline
" It is also installed on my computer
"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_theme='angr'
let g:airline_symbols.branch = ""
let g:airline_symbols.paste = "Þ"
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
let g:airline_left_sep=""
let g:airline_right_sep=""

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Hide whitespace errors
let g:airline#extensions#whitespace#enabled = 0

" Display only the filename in section c
let g:airline_section_c = airline#section#create(['%t'])

" Display the file type in section x
let g:airline_section_x = airline#section#create('%y')

" Display only the file encoding in section y
let g:airline_section_y = airline#section#create("%{strlen(&fenc)?&fenc:'none'}")

" Display only the line and column information in section z
let g:airline_section_z = airline#section#create(['Line %03l/%03L (%02p%%) Col:%03c'])

let g:airline_section_error = airline#section#create('')
let g:airline_section_warning = airline#section#create ('')

" Display syntax errors from Ale in the status line
let g:airline#extensions#ale#enabled = 1

" EXAMPLES FROM :help airline
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic, eclim)
" let g:airline_section_warning (ycm_warning_count, whitespace)



" #########################
" ###### Startify
" ########################

let g:startify_update_oldfiles = 1

autocmd VimEnter *
\   if !argc()
\ |   Startify
\ |   VimFilerExplorer -direction=topleft
\ |   wincmd w
\ | endif

let g:startify_custom_header = [
\ '                                                                            ',
\ '    o             o  o----o  o       o-----o  o-----o  o       o  o----o    ',
\ '     \     o     /   |       |       |        |     |  | \   / |  |         ',
\ '      \   / \   /    |----o  |       |        |     |  |  \ /  |  |----o    ',
\ '       \ /   \ /     |       |       |        |     |  |   o   |  |         ',
\ '        o     o      o----o  o----o  o-----o  o-----o  o       o  o----o    ',
\ '                                                                            ',
\ '                       o---o   o-----o  o-----o  o   o                      ',
\ '                       |   |   |     |  |        |  /                       ',
\ '                       o---o   |-----|  |        |--                        ',
\ '                       |    \  |     |  |        |  \                       ',
\ '                       o----o  o     o  o-----o  o   o                      ',
\ ]



" #########################
" ###### Tagbar
" ########################
" Set the width to be x columns
let g:tagbar_width = 30

" Display tagbar info compactly
let g:tagbar_compact = 1

" Open the tagbar when vim starts if the file being opened is supported
" autocmd VimEnter * nested :call tagbar#autoopen(1)

" To view a list of colors available run :highlight
highlight TagbarHighlight ctermfg=109 ctermbg=237 guifg=#83a598 guibg=#3c3836

" Sort by order of appearence in the file, not by alphabetical
let g:tagbar_sort = 0



" #########################
" ###### Ale
" ########################

" Use the quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Open the list
let g:ale_open_list = 1

" Wait n ms before linting after text is changed
let g:ale_lint_delay = 700

nnoremap <Leader>tl :ALEToggle<CR>

let g:ale_linters = {
\	'javascript': ['eslint'],
\	'SCSS': ['styleint'],
\}



" #########################
" ###### Vim Devicons
" ########################

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
