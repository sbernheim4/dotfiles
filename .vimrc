""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Vim motions on speed!
" Plug 'easymotion/vim-easymotion'

" Vim plugin for intensely orgasmic commenting
" Plug 'scrooloose/nerdcommenter'

" A tree explorer plugin for vim.
" Plug 'scrooloose/nerdtree'

" Vim and Neovim plugin to reveal the commit messages under the cursor
" Plug 'rhysd/git-messenger.vim'

" 🌷 Distraction-free writing in Vim
" Plug 'junegunn/goyo.vim'

" Extra syntax and highlight for nerdtree files
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" 🔣 Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
" Plug 'ryanoasis/vim-devicons'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" A different approach to code highlighting. http://www.vim.org/scripts/script.php…
Plug 'thiagoalessio/rainbow_levels.vim'

" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

" Vastly improved Javascript indentation and syntax support in Vim. http://www.vim.org/scripts/script.php…
Plug 'pangloss/vim-javascript'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'tpope/vim-surround'

" Plug '~/personal/sampleplugin/'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHME SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
syntax on
set termguicolors

set background=dark

colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the Leader key , instead of the default \
let mapleader=","

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

" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

" Use utf8 as the encoding format for files
set encoding=utf8

" Allow the backspace button to work as normal
set backspace=indent,eol,start

" Persist undo (just for neovim), even after vim is closed and reopened
if (has('nvim'))
    set undofile
endif

" Have vim splits open on the right and on the bottom by default
set splitbelow
set splitright

" Start scrolling when you hit 10 lines above or below the buffer start/end
set scrolloff=4

" Write on :next/:prev/^Z
set autowrite

" Search as you type (for vim)
set incsearch

set scl=no

" ************** Custom Highlight Groups **************

" Set color for vertical bar for the color column
hi ColorColumn guibg=#3a3a3a

" Set background for vertical vim split
" hi VertSplit guibg=#3a3a3a guifg=#3a3a3a
hi vertsplit guifg=#444444

" Highlight color for the cursor line
hi CursorLine guibg=#212121

" ****************** Tabs and Spaces ******************
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>

" Toggle highlighting of search results
nnoremap <Leader>hl :set hlsearch!<CR>

" Toggle cursor line highlight
nnoremap <Leader>cll :set cursorline!<CR>

" Create a new buffer
nnoremap <Leader>b :enew<CR>

" Move to the next buffer
noremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Split the curent window vertically or horizontally (Useful when you want to have the same file open at two different
" locations at the same time)
nnoremap <Leader>vsp :vsplit<CR>
nnoremap <Leader>hsp :split<CR>

" Vertically and horizontally resize a window
nnoremap <Leader>vrs :vertical resize +
nnoremap <Leader>hrs :resize +

nnoremap <Leader>r :source ~/.vimrc<CR>

" Display the path of the current file
nnoremap <Leader>pwf :echo expand("%p")<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Toggle function for the sign column
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=1
    endif
endfunction

" Automatically hide and show the sign column when switching buffers
augroup reduce_noise
    autocmd!
    autocmd WinEnter * :set scl=auto
    autocmd WinLeave * :set scl=no
augroup END

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
    if (&textwidth == 0)
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

" Use zz to place current line n lines above the center
" nnoremap zz zt5<C-y>

" Don't jump to the next occurance automatically when searching via *
nnoremap * *N zz

" Status Line

function! GetMode()
    let l:mode = mode()
    if l:mode == 'n'
        return 'NORMAL'
    elseif l:mode == 'i'
        return 'INSERT'
    elseif l:mode == 'v'
        return 'VISUAL'
    elseif l:mode == 'c'
        return 'COMMAND'
    else
        return '¯\_(ツ)_/¯'
    endif
endfunction

let g:left_sep=""
let g:right_sep=""

" Left side of status line

set statusline=

set statusline+=%1*
set statusline+=\ %{GetMode()}
set statusline+=\ %2*
set statusline+=%{g:left_sep}
set statusline+=%3*
set statusline+=\ %4*
set statusline+=%{g:left_sep}
set statusline+=\ %.30F\ |
set statusline+=%9*
set statusline+=%{g:left_sep}

set statusline+=%=

" Right side of status line
set statusline+=%8*
set statusline+=%{g:right_sep}
set statusline+=%5*
set statusline+=\ Line
set statusline+=\ %04l
set statusline+=\ /
set statusline+=\ %L
set statusline+=\ (%p%%)
set statusline+=%7*
set statusline+=\ %{g:right_sep}
set statusline+=%6*
set statusline+=\ \ Col:
set statusline+=\ %-3c
set statusline+=\ |

hi User1 guibg=#424242 guifg=#ffaf00
hi User2 guibg=#282828 guifg=#424242
hi User3 guibg=#282828 guifg=#ebdbb2
hi User4 guibg=#458588 guifg=#282828
hi User9 guibg=#282828 guifg=#458588

hi User5 guibg=#458588 guifg=#282828
hi User6 guibg=#404040 guifg=#ebdbb2
hi User7 guibg=#458588 guifg=#404040
hi User8 guibg=#282828 guifg=#458588

set laststatus=2
set noshowmode


set showtabline=2
set tabline=
set tabline+=%1*
set tabline+=%1t

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" #########################
" ######## FZF
" ########################

nnoremap ff :Files<CR>

" ########################
" ######## Vim-Javascript
" ########################

" Enable jsdoc/esdoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

" ########################
" ######## Coc
" ########################

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
"
" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Add a cursor for multiple cursors
nmap <silent> <Leader>c <Plug>(coc-cursors-position)

" Show function signature when `K` is pressed
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Use `:Format` to format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Remap for do codeAction of current line
nmap <Leader>ac <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <Leader>qf <Plug>(coc-fix-current)

nmap <Leader>fr <Plug>(coc-references)

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver'
\ ]
