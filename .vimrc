""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Auto complete package
" After running :PlugInstall cd to the YouCompleteMe folder and run ./install.sh
Plug 'Valloric/YouCompleteMe'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

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

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" 🔗 The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" List of JavaScript ES6 snippets and syntax highlighting for vim.
Plug 'isruslan/vim-es6'

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

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the Leader key , instead of the default \
let mapleader=","

syntax enable
syntax on
set t_Co=256
let base16colorspace=256

set background=dark " for the dark version
" use a gray background instead of the default blue
"let g:neodark#background='gray'
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

" Set the tab stop to 4
set tabstop=4
"
" Helps with autoindenting when using =
set shiftwidth=4

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Have line wrapping off by default
set nowrap

" Displays the eol character
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set listchars=tab:\|\ ,
" set listchars=tab:•\ ,eol:¬
set list

" Add ctrl-p to runtime path
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Fix to make sure switching from insert mode to normal mode is fast but that
" easy motion is still possible I think because of the ttimeoutlen=0
set timeoutlen=400 ttimeoutlen=0

" Hide the default mode indicator. Do so because airline will show the current mode
set noshowmode

" Display vim airline at the botom of the window
set laststatus=2

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

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

nnoremap <Leader>sp :split<CR>
nnoremap <Leader>vsp :vsplit<CR>

" Delete all extra whitespace on save
" nnoremap :w :FixWhitespace<CR>:w<CR>

" Vertically resize a window
nnoremap vrs :vertical resize

" Use tt to togle the tagbar open and close
nnoremap tt :TagbarToggle<CR>

" Use fzf to open files --> Alternative to Ctrl-P
" Toggles NERDTree and then opens fzf window to find file so new file isn't
" opened in the NERDTree space --> ONLY WORKS THIS WAY IF NERDTree is already
" open and file is opened in a new buffer
nnoremap nff :NERDTreeToggle<CR> :Files<CR>

" Opens fzf window without toggling NERDTree
nnoremap ff :Files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS TO MODIFY SPECIFIC  PACKAGES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" #########################
" ###### NERDTree
" ########################

" Toggle NERDTree
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>

" Choose the arrow character NERDTree will use
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▿'
" ▾
" Have NERDTree be open automatically when vim starts --> Handled by cmd for use with startify
" autocmd VimEnter * NERDTree


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
" ###### Trailing-White-Space
" ########################
" Type dws when in normal mode to run :FixWhitespace
nnoremap dws :FixWhitespace<CR>


" #########################
" ###### Airline
" ########################

" Get the right symbols for the status bar
" Using the font Meslo LG S Regular for Powerline which can be found here: https://github.com/powerline/fonts/tree/master/Meslo
" It is also installed on my personal computer

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Using the font Meslo LG S Regular for Powerline which can be found here:
" https://github.com/powerline/fonts/tree/master/Meslo
" Currently using DejaVu Sans Mono for Powerline
" It is also installed on my personal computer

let g:airline_theme='bubblegum'
let g:airline_symbols.branch = ""
let g:airline_symbols.paste = "Þ"
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename and not the extension
let g:airline#extensions#tabline#fnamemod = ':t'

" Hide whitespace errors
let g:airline#extensions#whitespace#enabled = 0

" Display only the filename in section c
let g:airline_section_c = airline#section#create(['%t'])

" Display the file type in section x
let g:airline_section_x = airline#section#create(['%y'])

" Display only the file encoding in section y
let g:airline_section_y = airline#section#create(["%{strlen(&fenc)?&fenc:'none'}"])

" Display only the line and column information in section z
let g:airline_section_z = airline#section#create(['Line %03l/%03L (%02p%%) Col: %03c'])

" Display syntax errors from Ale in the status line
" let g:airline#extensions#ale#enabled = 1

" EXAMPLES FROM :help airline
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic, eclim)
" let g:airline_section_warning (ycm_warning_count, whitespace)])

" #########################
" ###### Startify
" ########################

let g:startify_update_oldfiles = 1

autocmd VimEnter *
			\   if !argc()
			\ |   Startify
			\ |   NERDTree
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
" Set the width to be 40 columns
let g:tagbar_width = 40

" Display tagbar info compactly
let g:tagbar_compact = 1

" Open the tagbar when vim starts if the file being opened is supported
autocmd VimEnter * nested :call tagbar#autoopen(1)

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
