" Make the Leader key , instead of the default \
let mapleader=","

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
" NOTE: colorscheme is set in the plugin manager
syntax enable
syntax on
set termguicolors
set background=dark

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
require 'lazy_config'
require 'lsp_signature_settings'
require 'lspconfig_settings'
require 'nvim_tree_settings'
require 'lspfuzzy_settings'
require 'nvim_treesitter_settings'
require 'navic_settings'
require 'nvim_treesitter_context'
require 'cmp_settings'
require 'symbols_outline_settings'
require 'telescope_settings'
require 'helper_functions'
require 'dashboard_settings'
require 'mappings'

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
