""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" hi my name is samuel \ 
" I like to eat food

" Auto complete package
" After running :PlugInstall cd to the YouCompleteMe folder and run ./install.sh
Plug 'Valloric/YouCompleteMe'

" Tree view package
Plug 'scrooloose/nerdtree'

" Makes inserting multiple comments easy by text selection
Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'

" Easy way to naviagte to many different points on the current screen
Plug 'easymotion/vim-easymotion'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" Git diff marks in gutter
Plug 'airblade/vim-gitgutter'

" Command-line fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" This plugin causes all trailing whitespace to be highlighted in red.
Plug 'bronson/vim-trailing-whitespace'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" javascript syntax highlighting
Plug 'jelera/vim-javascript-syntax'

Plug 'ternjs/tern_for_vim'

"🔗 The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the Leader key , instead of the default \
let mapLeader=","

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

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

nnoremap <Leader>sp :split<CR>
nnoremap <Leader>vsp :vsplit<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS TO MODIFY SPECIFIC  PACKAGES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_w = 0
" let g:syntastic_loc_list_height = 5

" Run syntastic check
nnoremap <Leader>sc :SyntasticCheck<CR>

" Close syntastic check window
nnoremap <Leader>sr :SyntasticReset<CR>

let g:startify_update_oldfiles = 1

autocmd VimEnter *
			\   if !argc()
			\ |   Startify
			\ |   NERDTree
			\ |   wincmd w
			\ | endif

let g:startify_custom_header = [
			\ '	█░░░█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀   █▀▀▄ █▀▀█ █▀▀ █░█ ',
			\ '	█▄█▄█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀   █▀▀▄ █▄▄█ █░░ █▀▄ ',
			\ '	░▀░▀░ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀   ▀▀▀░ ▀░░▀ ▀▀▀ ▀░▀ ',
			\ ]

" Have NERDTree be open automatically when vim starts --> Handled by the above
" cmd for use with startify
" autocmd VimEnter * NERDTree

" Toggle NERDTree
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" nnoremap <Leader>t :CtrlP<CR>

" Run easymotion commands in a direction --> based off of hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Type dws when in normal mode to run :FixWhitespace
nnoremap dws :FixWhitespace<CR>

" Use fzf to open files --> Alternative to Ctrl-P
" Toggles NERDTree and then opens fzf window to find file so new file isn't
" opened in the NERDTree space --> ONLY WORKS THIS WAY IF NERDTree is already
" open and file is opened in a new buffer
nnoremap nff :NERDTreeToggle<CR> :Files<CR>

" Opens fzf window without toggling NERDTree
nnoremap ff :Files<CR>

" Get the right symbols for the status bar
" Using the font Meslo LG S Regular for Powerline which can be found here: https://github.com/powerline/fonts/tree/master/Meslo
" It is also installed on my personal computer

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Using the font Meslo LG S Regular for Powerline which can be found here:
" https://github.com/powerline/fonts/tree/master/Meslo
" It is also installed on my personal computer
" Using the font octicons.otf which can be found in one of the comments here:
" https://github.com/vim-airline/vim-airline/issues/237

let g:airline_theme='bubblegum'
let g:airline_symbols.branch = ""
let g:airline_symbols.paste = "Þ"
" let g:airline_left_sep = '>'
" let g:airline_right_sep = '<'

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

let g:airline_section_error = airline#section#create(['ycm_error_count', 'syntastic'])

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
