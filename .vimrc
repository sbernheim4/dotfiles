""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins for vim. Using VimPlug as the package manager 

call plug#begin('~/.vim/plugged') 

" Auto complete package 
Plug 'Valloric/YouCompleteMe'

" Tree view package 
Plug 'scrooloose/nerdtree'

" React JSX Syntax highlighting and indenting for vim
Plug 'mxw/vim-jsx'

" Easy way to naviagte to many different points on the current screen
Plug 'easymotion/vim-easymotion'

" Lint plugin that shows linting errors 
Plug 'https://github.com/scrooloose/syntastic.git'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" git diff marks in gutter
Plug 'airblade/vim-gitgutter'

" command-line fuzzy finder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}

" Makes inserting multiple comments easy by text selection
Plug 'scrooloose/nerdcommenter'

" Plugin for a vim status bar and its themes. Automatically integrates compatible packages 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end() 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM 

" use the deep-space color scheme located in the /colors folder
syntax enable 
set background=dark
set t_Co=16
colorscheme deep-space

" unbinds the arrow keys and makes them stop working
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" shows line numbers by default when opening files
set number

" make the leader key , instead of the default \
let mapleader = ","

" set the tab stop to 4
set tabstop=4

" allow the backspace button to work as normal
set backspace=indent,eol,start	

" displays the eol character
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY ORRECTLY
set listchars=eol:¬,tab:\ \ ,extends:>,precedes:<
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS TO MODIFY SPECIFIC  PACKAGES

" have NERDTree be open automatically when vim starts
autocmd VimEnter * NERDTree 

" run easymotion commands in a direction --> based off of hjkl
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

command Sc :SyntasticCheck <bar> :Errors
command Qsc :lclose <bar> :SyntasticToggleMode 

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Use the wombat theme 
let g:airline_theme='wombat'
" Hide whitespace errors
let g:airline#extensions#whitespace#enabled = 0
" Left and right separators
" Hide section A
let g:airline_section_a = airline#section#create([])
" Display only the name in section c
let g:airline_section_c = airline#section#create(['%t'])

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
