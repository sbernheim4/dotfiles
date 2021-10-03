" Make the Leader key , instead of the default \
let mapleader=","

" ########################################################################
" ######## Vim Plug and Plugins
" ########################################################################
call plug#begin('~/.vim/plugged')

" Misc.
Plug 'christoomey/vim-tmux-navigator'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'ap/vim-buftabline'

" Feature Enhancers
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sbernheim4/vim-ripgrep'
Plug 'mhinz/vim-signify'
Plug 'ruanyl/vim-gh-line'
Plug 'rhysd/git-messenger.vim'

" Text Manipulation
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/sideways.vim'
Plug 'FooSoft/vim-argwrap'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'gruvbox-community/gruvbox'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
Plug 'nvim-lua/popup.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'ray-x/lsp_signature.nvim'
Plug 'jparise/vim-graphql'
Plug 'nvim-lua/plenary.nvim'

" Snippets and Completion
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Plug 'fsharp/vim-fsharp', {
"       \ 'for': 'fsharp',
"       \ 'do':  'make fsautocomplete',
"       \}

" For linting/formatting via ESLint and Prettier
Plug 'dense-analysis/ale'

call plug#end()

autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal spell

" Vim Plugin Mappings

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
nnoremap <Leader>f :Rg

" ########################################################################
" ######## Vim-Signify
" ########################################################################
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sh :SignifyToggleHighlight<CR>

let g:signify_sign_add = '▐'
let g:signify_sign_delete = '▐'
let g:signify_sign_change = '▐'
let g:signify_line_highlight = 0
let g:signify_disable_by_default = 0

" ########################################################################
" ######## vim-qf | Vim Quickfix
" ########################################################################
nmap cm <Plug>(qf_qf_toggle)
nmap cl <Plug>(qf_loc_toggle)

let g:qf_mapping_ack_style = 1
let g:qf_shorten_path = 0

" ########################################################################
" ######## Sideways
" ########################################################################
nnoremap <Leader><Leader>s :SidewaysLeft<CR>
nnoremap <Leader><Leader>l :SidewaysRight<CR>

" ########################################################################
" ######## ArgWrap
" ########################################################################
let g:argwrap_padded_braces = '{'
nmap <silent> <leader>aw <Plug>(ArgWrapToggle)

" ########################################################################
" ######## Dashboard Nvim
" ########################################################################
let g:dashboard_default_executive ='fzf'
let g:dashboard_default_header='lambada'

let g:dashboard_custom_shortcut={
            \ 'new_file'           : '         e',
            \ 'find_file'          : '       f f',
            \ 'last_session'       : '   SPC s l',
            \ 'find_history'       : '  :History',
            \ 'change_colorscheme' : '   :Colors',
            \ 'find_word'          : '       :Rg',
            \ 'book_marks'         : ':Bookmarks',
            \ }

" ########################################################################
" ######## Ale
" ########################################################################
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'] }
let g:ale_fixers = {
            \   'javascript': [
            \       'eslint'
            \   ],
            \  'typescript': [
            \      'eslint'
            \  ]
            \ }

let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load additional vim mappings, settings, and helpers
source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim

" Load Lua Plugins - I have one file per plugin
lua << EOF
require 'lsp_signature_settings'
require 'lspconfig_settings'
require 'lspfuzzy_settings'
require 'nvim_treesitter_settings'
require 'scala_metals_settings'
require 'cmp_settings'
EOF

" ########################################################################
" ######## LSP Mappings
" ########################################################################
nnoremap <silent> <Leader>gd  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>td  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <Leader>fr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>s   <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <Leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>ac  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>gg  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>gn  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>gp  <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <Leader>s   <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> tt          <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nmap <silent> <Leader>ee <Plug>(coc-refactor)

" ########################################################################
" ######## Custom Highlight Groups
" ########################################################################
highlight Visual guifg=#575757 guibg=#d1d1d1
highlight QuickFixLine guibg=#707070 guifg=#e8d8c5

highlight LspDiagnosticsDefaultError guifg=#e5898b
highlight LspDiagnosticsDefaultWarning guifg=#edbb7b
highlight LspDiagnosticsDefaultHint guifg=#b1bbbf

highlight SignifySignAdd  guifg=#b8ba25
highlight SignifySignDelete guifg=#fa4933
highlight SignifySignChange guifg=#458488

" Set color for vertical bar for the color column
hi ColorColumn guibg=#3a3a3a

" Set background for vertical vim split
hi vertsplit guifg=#c4ab97 guibg=#c4ab97

" Highlight color for the cursor line
hi CursorLine guibg=#3d3d3d

hi SignColumn guibg=#282828
