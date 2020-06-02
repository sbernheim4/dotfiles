" Make the Leader key , instead of the default \
let mapleader=","

" ########################################################################
" ######## Using Vim-Plug for plugin manager
" ########################################################################
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Use RipGrep in Vim and display results in a quickfix list
Plug 'sbernheim4/vim-ripgrep'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" 🔦 [Vim script] JSX and TSX syntax pretty highlighting for vim.
Plug 'MaxMEllon/vim-jsx-pretty'

" React JSX syntax highlighting for vim and Typescript
Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

" Vastly improved Javascript indentation and syntax support in Vim. http://www.vim.org/scripts/script.php…
Plug 'pangloss/vim-javascript'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'on': [] }

" Range, pattern and substitute preview for Vim
Plug 'markonm/traces.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" vim plugin that open the link of current line on github
Plug 'ruanyl/vim-gh-line'

" ➕  Show a diff using Vim its sign column
Plug 'mhinz/vim-signify'

" Tame the quickfix window
Plug 'romainl/vim-qf'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc. http://www.vim.org/scripts/script.php…
Plug 'Raimondi/delimitMate'

" surround.vim: quoting/parenthesizing made simple http://www.vim.org/scripts/script.php…
Plug 'tpope/vim-surround'

" F# bindings for vim
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

" A Vim plugin to move function arguments (and other delimited-by-something items) left and right. http://www.vim.org/scripts/script.php…
Plug 'AndrewRadev/sideways.vim'

" 🔧 JavaScript & NodeJS Snippets for Vim
Plug 'grvcoelho/vim-javascript-snippets'

call plug#end()

let g:fsharp_map_keys = 0

" Lazy load coc after insert mode is entered to keep vim snappy
" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup lazy_load_plugins
  autocmd!
  autocmd InsertEnter * call plug#load('coc.nvim')
augroup END

autocmd FileType help wincmd L

" Enable spell checking for commit messages
autocmd FileType gitcommit setlocal spell

" ########################################################################
" ######## NERDTree
" ########################################################################
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nt :NERDTree<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind <CR>

let g:NERDTreeWinPos = 'right'

" ########################################################################
" ######## FZF
" ########################################################################

nnoremap ff :Files<CR>
nnoremap aa :Buffers<CR>

" ########################################################################
" ######## Vim-Javascript
" ########################################################################

" Enable jsdoc/esdoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

" ########################################################################
" ######## Coc
" ########################################################################

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

" Find symbol of current document
nmap <silent> <silent> tt :<C-u>CocList outline<CR>

" Search workspace symbols
nmap <silent> <Leader>s :<C-u>CocList symbols<CR>

" Go to the definition of the value the cursor is on
nmap <silent> <Leader>gd <C-w>v<Plug>(coc-definition)
"
" Remap for rename current word
nmap <silent> <Leader>rn <Plug>(coc-rename)

" Show function signature when `K` is pressed
nmap <silent> K :call <SID>show_documentation()<CR>

" Remap for do codeAction of current line
nmap <silent> <Leader>ac <Plug>(coc-codeaction)

nmap <silent> <Leader>fr <Plug>(coc-references)

nmap <silent> <Leader>ee <Plug>(coc-refactor)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver'
\ ]

" ########################################################################
" ######## Vim-Signify
" ########################################################################
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sh :SignifyToggleHighlight<CR>

let g:signify_sign_add = '▐'
let g:signify_sign_delete = '▐'
let g:signify_sign_change= '▐'
" Don't highlight the line by default when the plugin is enabled
let g:signify_line_highlight = 0
" Disable the plugin by default
let g:signify_disable_by_default = 1

" ########################################################################
" ######## Vim-Quickfix
" ########################################################################
let g:qf_mapping_ack_style = 1

" Don't shorten file names in the quickfix or location list
let g:qf_shorten_path = 0
nmap cm <Plug>(qf_qf_toggle)

" ########################################################################
" ######## Sideways
" ########################################################################

nnoremap <Leader><Leader>s :SidewaysLeft<CR>
nnoremap <Leader><Leader>l :SidewaysRight<CR>

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim
source ~/dotfiles/vim/settings.vim

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

highlight SignifySignAdd  guifg=#b8ba25 cterm=NONE gui=NONE
highlight SignifySignDelete guifg=#fa4933 cterm=NONE gui=NONE
highlight SignifySignChange guifg=#458488 cterm=NONE gui=NONE
highlight Visual guifg=#575757 guibg=#d1d1d1
highlight QuickFixLine guibg=#707070 guifg=#e8d8c5
