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
Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }

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
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'gruvbox-community/gruvbox'

" LSP
Plug 'github/copilot.vim'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'ray-x/lsp_signature.nvim'

" Snippets and Completion
Plug 'hrsh7th/nvim-cmp'

" Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'simrat39/symbols-outline.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" For linting/formatting via ESLint and Prettier
Plug 'dense-analysis/ale'
Plug 'nvim-tree/nvim-web-devicons'


" Plug 'editorconfig/editorconfig-vim'

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

" Adds 30ms
source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim
source ~/dotfiles/vim/highlights.vim

" Load Plugin Settings
source ~/dotfiles/vim/vim-plugins/ale.vim
source ~/dotfiles/vim/vim-plugins/argwrap.vim
source ~/dotfiles/vim/vim-plugins/fzf.vim
source ~/dotfiles/vim/vim-plugins/sideways.vim
source ~/dotfiles/vim/vim-plugins/signify.vim

" Load Lua Plugins
lua << EOF
require 'lsp_signature_settings'

-- adds 50ms
require 'lspconfig_settings'

-- Adds 50ms
require 'nvim_tree_settings'

require 'lspfuzzy_settings'
require 'nvim_treesitter_settings'
require 'navic_settings'
require 'nvim_treesitter_context'
require 'cmp_settings'
require 'symbols_outline_settings'
require 'helper_functions'
require 'dashboard_settings'
require 'copilot_settings'

local links = {
   ['@lsp.type.namespace'] = '@namespace',
   ['@lsp.type.type'] = '@type',
   ['@lsp.type.class'] = '@type',
   ['@lsp.type.enum'] = '@type',
   ['@lsp.type.interface'] = '@type',
   ['@lsp.type.struct'] = '@structure',
   ['@lsp.type.parameter'] = '@parameter',
   ['@lsp.type.variable'] = '@constant',
   ['@lsp.type.property'] = '@property',
   ['@lsp.type.enumMember'] = '@constant',
   ['@lsp.type.function'] = '@function',
   ['@lsp.type.method'] = '@method',
   ['@lsp.type.macro'] = '@macro',
   ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true, })
end
EOF

nnoremap <silent> <Leader>d :NvimTreeToggle<CR>
nnoremap <silent> <Leader>nf :NvimTreeFindFile<CR>
nnoremap <silent> <Leader>nt :NvimTreeRefresh<CR>
