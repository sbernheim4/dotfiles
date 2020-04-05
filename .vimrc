" Make the Leader key , instead of the default \
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using Vim-Plug for plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" 🔣 Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Use RipGrep in Vim and display results in a quickfix list
Plug 'sbernheim4/vim-ripgrep'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

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

" ➕  Show a diff using Vim its sign column.Temp
Plug 'mhinz/vim-signify', { 'on': ['SignifyToggle', 'SignifyToggleHighlight'] }
call plug#end()

" Lazy load coc after insert mode is entered to keep vim snappy
" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup load_coc
  autocmd!
  autocmd InsertEnter * call plug#load('coc.nvim')
augroup END

" ########################################################################
" ######## NERDTree
" ########################################################################
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree<CR>
nnoremap <Leader>nf :NERDTreeFind <CR>

let g:NERDTreeWinPos = 'right'

" ########################################################################
" ######## FZF
" ########################################################################

nnoremap ff :Files<CR>
nnoremap aa :Buffers<CR>

" ########################################################################
" ######## Rg
" ########################################################################

nnoremap <Leader>f :Rg
nnoremap <Leader>ff :Rgg '

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
nmap <silent> <Leader>gd <Plug>(coc-definition)
"
" Remap for rename current word
nmap <silent> <Leader>rn <Plug>(coc-rename)

" Add a cursor for multiple cursors
nmap <silent> <Leader>c <Plug>(coc-cursors-position)

" Show function signature when `K` is pressed
nmap <silent> K :call <SID>show_documentation()<CR>

" Remap for do codeAction of current line
nmap <silent> <Leader>ac <Plug>(coc-codeaction)

" Fix auto fix problem of current line
nmap <silent> <Leader>qf <Plug>(coc-fix-current)

nmap <silent> <Leader>fr <Plug>(coc-references)

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
    \ 'coc-pairs',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver'
\ ]

" ########################################################################
" ######## Vim-Signify
" ########################################################################
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sh :SignifyEnable<CR> :SignifyToggleHighlight<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SCHEME SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/dotfiles/vim_settings/mappings.vim
source ~/dotfiles/vim_settings/statusLine.vim
source ~/dotfiles/vim_settings/settings.vim
