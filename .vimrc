""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Auto complete package
" After running :PlugInstall cd to the YouCompleteMe folder and run ./install.sh
Plug 'Valloric/YouCompleteMe'

" Tree view package
Plug 'scrooloose/nerdtree'

" Makes inserting multiple comments easy by text selection
Plug 'scrooloose/nerdcommenter'

" Easy way to naviagte to many different points on the current screen
Plug 'easymotion/vim-easymotion'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" Git diff marks in gutter
Plug 'airblade/vim-gitgutter'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}

" Run git commands from inside vim. Also displays the current branch in the status bar
Plug 'tpope/vim-fugitive'

" Plugin for a vim status bar and its themes. Automatically integrates compatible packages
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This plugin causes all trailing whitespace to be highlighted in red.
" Plug 'bronson/vim-trailing-whitespace'
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the deep-space color scheme located in the /colors folder
syntax enable
set background=dark
set t_Co=16
colorscheme onedark

" Unbinds the arrow keys and makes them stop working
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Shows line numbers by default when opening files
set number

" Make the leader key , instead of the default \
 let mapleader = ","

" Set the tab stop to 4
set tabstop=4

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Displays the eol character
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set listchars=tab:▸\ ,eol:¬
set list

" Hide the default mode indicator. Do so because status bar will show current mode
set noshowmode

" Wrap text on the screen appropriately (don't wrap in the middle of the word)
:set wrap
:set linebreak

set timeoutlen=1000 ttimeoutlen=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS TO MODIFY SPECIFIC  PACKAGES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Have NERDTree be open automatically when vim starts
autocmd VimEnter * NERDTree

" Run easymotion commands in a direction --> based off of hjkl
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Get the right symbols for the status bar
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Using the font Meslo LG S Regular for Powerline which can be found here: https://github.com/powerline/fonts/tree/master/Meslo
" It is also installed on my personal computer
let g:airline_left_sep = '⇒ '
let g:airline_right_sep = '⇐ '
" ▶   ◀"
" ⇛   ⇚ 
" Using the font octicons.otf which can be found in one of the comments here:
" https://github.com/vim-airline/vim-airline/issues/237
let g:airline_symbols.branch = ""


" Use the wombat theme
let g:airline_theme='wombat'
" Hide whitespace errors
let g:airline#extensions#whitespace#enabled = 0
" Display only the filename in section c
let g:airline_section_c = airline#section#create(['%t'])
" Display only the file encoding in section y
let g:airline_section_y = airline#section#create(["%{strlen(&fenc)?&fenc:'none'}"])
"Display only the line and column information in section z
let g:airline_section_z = airline#section#create(['Line %03l/%03L (%02p%%) Col: %02c'])

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

" Type dws when in normal mode to run :FixWhitespace
nnoremap dws :FixWhitespace
