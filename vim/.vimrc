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
Plug 'kyazdani42/nvim-tree.lua'
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
Plug 'gruvbox-community/gruvbox'

" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'ray-x/lsp_signature.nvim'
Plug 'jparise/vim-graphql'

" Snippets and Completion
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'simrat39/symbols-outline.nvim'

" For linting/formatting via ESLint and Prettier
Plug 'dense-analysis/ale'

call plug#end()

autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal spell

" ########################################################################
" ######## vim-qf | Vim Quickfix
" ########################################################################
nmap cm <Plug>(qf_qf_toggle)
nmap cl <Plug>(qf_loc_toggle)

let g:qf_mapping_ack_style = 1
let g:qf_shorten_path = 0

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load additional settings
source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim
source ~/dotfiles/vim/highlights.vim

" Load Plugin Settings
source ~/dotfiles/vim/vim-plugins/ale.vim
source ~/dotfiles/vim/vim-plugins/argwrap.vim
source ~/dotfiles/vim/vim-plugins/dashboard.vim
source ~/dotfiles/vim/vim-plugins/fzf.vim
source ~/dotfiles/vim/vim-plugins/nerdtree.vim
source ~/dotfiles/vim/vim-plugins/sideways.vim
source ~/dotfiles/vim/vim-plugins/signify.vim

" Load Lua Plugins
lua << EOF
require 'lsp_signature_settings'
require 'lspconfig_settings'
require 'lspfuzzy_settings'
require 'nvim_treesitter_settings'
require 'scala_metals_settings'
require 'cmp_settings'
require 'symbols_outline_settings'
require 'copilot_settings'
require 'nvim_tree_settings'
EOF

nnoremap <silent> <Leader>d :NvimTreeToggle<CR>
nnoremap <silent> <Leader>nf :NvimTreeFindFile<CR>
nnoremap <silent> <Leader>nt :NvimTreeRefresh<CR>
