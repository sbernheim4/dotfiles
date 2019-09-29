""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" ➕ Show a diff using Vim its sign column.
Plug 'mhinz/vim-signify'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" 🔗  The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" 🔣 Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

" Vastly improved Javascript indentation and syntax support in Vim. http://www.vim.org/scripts/script.php…
Plug 'pangloss/vim-javascript'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
" https://www.vim.org/scripts/script.ph…
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Also install coc-eslint, coc-snippets, coc-css, and coc-json via :CocInstall <item>
" Run :CocCommand snippets.openSnippetFiles to edit snippets files.

" Vim and Neovim plugin to reveal the commit messages under the cursor
Plug 'rhysd/git-messenger.vim'

" A different approach to code highlighting. http://www.vim.org/scripts/script.php…
Plug 'thiagoalessio/rainbow_levels.vim'

Plug 'wakatime/vim-wakatime'

" 🌷 Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

call plug#end()
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHME SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the Leader key , instead of the default \
let mapleader=","

syntax enable
syntax on
let base16colorspace=256

if (has("termguicolors"))
   set termguicolors
endif

set background=dark

colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight the current cursor line
set cursorline

" Don't wrap lines by default
set nowrap

" When wraping text, do so appropriately (don't wrap in the middle of the word)
set linebreak

" Shows line numbers by default when opening files
set number

" Shows relative line numbers by default
set relativenumber

" Indent wrapped lines for easier separation
set breakindent

" Displays the special characters like eol, indents etc
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
" set listchars=tab:\|\ ,
" set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,
set list

" Hide the default mode indicator. Do so because airline will show the current mode
set noshowmode

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

" Use utf8 as the encoding format for files
set encoding=utf8

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" Persist undo, even after vim is closed and reopened
set undofile

" Have vim splits open on the right and on the bottom by default
set splitbelow
set splitright
"
" Set color for vertical bar for the color column
hi ColorColumn ctermbg=darkgray

" Set background for vertical vim split
hi VertSplit ctermbg=darkgray guibg=darkgray

" ****************** Tabs VS Spaces ********************
" Set the tab stop to 4
set tabstop=4

" Helps with autoindenting when using =
set shiftwidth=4

" Indent with spaces by default - only due to work :(
set expandtab

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

"" ****************************************************************



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

" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Create a new buffer
nnoremap <Leader>b :enew<CR>

" Move to the next buffer
nnoremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status --> Unnecessary since I am displaying open buffers at the top using airline
" nnoremap <Leader>bl :ls<CR>

" Split the curent window vertically or horizontally (Useful when you want to have the same file open at two different
" locations at the same time)
nnoremap <Leader>vsp :vsplit<CR>
nnoremap <Leader>hsp :split<CR>

" Vertically and horizontally resize a window
nnoremap <Leader>vrs :vertical resize +
nnoremap <Leader>hrs :resize +

" Useful fzf shortcuts
nnoremap ff :FZF<CR>
nnoremap aa :Buffers<CR>
nnoremap fif :BLines<CR>

nnoremap <Leader>r :source ~/.vimrc<CR>

" Search entire project dir for a string
nnoremap <Leader>f :Rg<CR>

" Display the path of the current file
nnoremap <Leader>pwf :echo expand("%p")<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Toggle showing the sign column
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=1
    endif
endfunction

nnoremap <Leader><Leader>g :call ToggleSignColumn()<CR>

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
    if (&textwidth == 0 && winwidth('%') > 120)
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Settings
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
" Have NERDTree be open automatically when vim starts --> Handled by cmd for use with startify
" autocmd VimEnter * NERDTree

" #########################
" ###### NerdCommenter
" ########################
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitesace = 1

" #########################
" ###### Signify
" #########################

let g:signify_vcs_list = [ 'git' ]

" Select symbols to use
let g:signify_sign_add               = ''
let g:signify_sign_delete            = ''
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = 'ﰣ'

" Toggle highlighting changes made
nnoremap <Leader>gh :SignifyToggleHighlight<CR>

" #########################
" ###### FZF
" #########################

" Open fzf windos at the bottom of the screen and take up ~20% of space
let g:fzf_layout = { 'down': '~20%' }

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

let g:airline_theme='wombat'
let g:airline_symbols.branch = ""
let g:airline_symbols.paste = "Þ"
" let g:airline_left_sep = "\uE0BC"
" let g:airline_right_sep = "\uE0BE"
let g:airline_left_sep=""
let g:airline_right_sep=""

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = "\uE0BC"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '  |'

" Display nothing in section x
let g:airline_section_x = ''
" Display nothing in section y
let g:airline_section_y = ''

" Display only the line and column information in section z
let g:airline_section_z = airline#section#create(['Line %03l/%03L (%02p%%) Col:%03c'])

let g:airline_section_error = airline#section#create('')
let g:airline_section_warning = airline#section#create ('')

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
" #########################

" When opening a file or bookmark, seek and change to the root directory of the
" VCS (if there is one).
let g:startify_change_to_vcs_root = 2

" Open Startify and NERDTree when starting vim
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
            \ | endif

" Custom message to display in startify menu
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
" ####### Coc
" #########################

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show commands
nnoremap <silent> <Leader>c :<C-u>CocList commands<CR>

" Find symbol of current document
nnoremap <silent> tt :<C-u>CocList outline<CR>

" Search workspace symbols
nnoremap <silent> <Leader>s :<C-u>CocList symbols<CR>

" Go to the definition of the value the cursor is on
nmap <silent> <Leader>gd <Plug>(coc-definition)

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Add a cursor for multiple cursors
nmap <silent> <Leader>c <Plug>(coc-cursors-position)

" Highlight group for cursors when using multiple cursors
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" #########################
" ####### RainbowLevels
" #########################

nnoremap <Leader>l :RainbowLevelsToggle<CR>

" #########################
" ####### Goyo
" #########################

nnoremap <silent> <Leader>go :Goyo 80%x80%<CR>
