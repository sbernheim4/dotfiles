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
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}

" This plugin causes all trailing whitespace to be highlighted in red.
Plug 'bronson/vim-trailing-whitespace'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS FOR VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the deep-space color scheme located in the /colors folder
syntax enable
" set t_Co=16

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one


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

" ▸•
" Displays the eol character
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set listchars=tab:•\ ,eol:¬
set list

" Hide the default mode indicator. Do so because status bar will show current mode
set noshowmode

" Wrap text on the screen appropriately (don't wrap in the middle of the word)
:set wrap
:set linebreak

" set timeoutlen=1000 ttimeoutlen=0

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

" Using the font Meslo LG S Regular for Powerline which can be found here: https://github.com/powerline/fonts/tree/master/Meslo
" It is also installed on my personal computer

" Type dws when in normal mode to run :FixWhitespace
nnoremap dws :FixWhitespace

let g:airline_theme='one'
