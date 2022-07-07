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

" Have vim splits open on the right and on the bottom by default
set splitbelow
set splitright

" Start scrolling when you hit 10 lines above or below the buffer start/end
set scrolloff=4

" Write on :next/:prev
set autowrite

set signcolumn=yes

" Automatically indent when typing as appropriate
set smartindent

" Time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=300

" ########################################################################
" ######## Line Wrapping
" ########################################################################
" Don't wrap lines by default
set nowrap

" Indent wrapped lines for easier separation
set breakindent

" When wrapping text, do so appropriately (don't wrap in the middle of the word)
set linebreak

set breakindentopt=shift:3,sbr

set textwidth=80
set colorcolumn=""

" ########################################################################
" ######## Backup Settings - Don't track swap files
" ########################################################################

set nobackup
set noswapfile
set noundofile

" ########################################################################
" ######## Tabs and Spaces
" ########################################################################

" Set the tab stop to 4
set tabstop=4

" Helps with auto indenting when using =
set shiftwidth=4

" Indent with tabs by default
set noexpandtab

" ########################################################################
" ######## Search Settings
" ########################################################################

" If search string contains only lowercase letters search is case insensitive.
set ignorecase

" If search string contains capital letters search is case sensitive
set smartcase

" Search as you type (NOTE: enabled by default in neovim)
set incsearch

set inccommand=split

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ########################################################################
" ######## Undo Info
" ########################################################################

set undodir=~/.vim/undo-dir

" Persist undo even after vim/neovim is closed and reopened
set undofile

" ########################################################################
" ######## List Characters
" ########################################################################

" Displays the special characters like eol, indents etc.
" DON'T MODIFY. OTHERWISE THE TAB CHARACTER WILL BE MESSED UP AND NOT DISPLAY CORRECTLY
set list
set listchars=tab:\|\ ,
set listchars=tab:•\ ,eol:¬
set listchars=tab:•\ ,

set fillchars+=vert:█

" ########################################################################
" ######## Status Line"
" ########################################################################

" Always show gloabl status line. NEOVIM ONLY
set laststatus=3

" Don't display mode changes in command line (displayed in status line)
set noshowmode

" #######################################################################
" ######## Folding
" ########################################################################

" https://github.com/nvim-treesitter/nvim-treesitter#syntax-based-code-folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" Don't set the fold column
set foldcolumn=0

" Open files without any folding
set foldlevelstart=99

" Enable folding for JS syntax
" let javaScript_fold=1

" #######################################################################
" ######## Completion Settings
" ########################################################################
set completeopt=menu,menuone,noselect,noinsert
set shortmess+=c
set shortmess-=F

function! GetSpaces(foldLevel)
    if &expandtab == 1
        " Indenting with spaces
        let str = repeat(" ", a:foldLevel / (&shiftwidth + 1) - 1)
        return str
    elseif &expandtab == 0
        " Indenting with tabs
        return repeat(" ", indent(v:foldstart) - (indent(v:foldstart) / &shiftwidth))
    endif
endfunction

function! MyFoldText()
    let startLineText = getline(v:foldstart)
    let endLineText = trim(getline(v:foldend))
    let indentation = GetSpaces(foldlevel("."))
    let spaces = repeat(" ", 500)

    let str = indentation . startLineText . "..." . endLineText . spaces

    return str
endfunction

" Custom display for text when folding
set foldtext=MyFoldText()

let blacklist = ['NvimTree', 'Outline', 'qf']


" From https://github.com/knubie/dotfiles/blob/fe7967f875945e54d49fc672f575c47691a1e4cc/.vimrc#L136
augroup ReduceNoise
    autocmd!

    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()

    autocmd WinEnter * if index(blacklist, &ft) < 0 | setlocal signcolumn=auto | endif
    autocmd WinLeave * if index(blacklist, &ft) < 0 | setlocal signcolumn=no | endif

    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline

    autocmd WinEnter * setlocal relativenumber
    autocmd WinLeave * setlocal norelativenumber

    autocmd WinEnter * :call ResizeSplits()

augroup END

function! ResizeSplits()
    if &ft == 'NvimTree'
		vertical resize 30
		set norelativenumber
		setlocal signcolumn=yes
        return
	elseif &ft == "Outline"
		set norelativenumber
		set number!
		return
    elseif &ft == 'qf'
        " Always set quickfix list to a height of 10
        resize 10
        return
    " else
    "     set winwidth=100
    "     wincmd =
    endif
endfunction
