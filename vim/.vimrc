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
Plug 'romainl/vim-qf'
Plug 'ruanyl/vim-gh-line'
Plug 'rhysd/git-messenger.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }


" Text Manipulation
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/sideways.vim'
Plug 'FooSoft/vim-argwrap'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax and highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'gruvbox-community/gruvbox'

" LSP & Linting
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'dense-analysis/ale'

call plug#end()

autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal spell

let g:javascript_plugin_jsdoc = 1
let g:doge_mapping='<Leader>dc'

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
let g:signify_disable_by_default = 1

highlight SignifySignAdd  guifg=#b8ba25 cterm=NONE gui=NONE
highlight SignifySignDelete guifg=#fa4933 cterm=NONE gui=NONE
highlight SignifySignChange guifg=#458488 cterm=NONE gui=NONE

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
" ######## Tresitter
" ########################################################################
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  ensure_installed = {"javascript", "typescript"},
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      }
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    navigation = { enable = false, }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
EOF

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
" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 0
" let g:ale_disable_lsp = 1

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Visual guifg=#575757 guibg=#d1d1d1
highlight QuickFixLine guibg=#707070 guifg=#e8d8c5

source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

highlight Visual guifg=#575757 guibg=#d1d1d1
highlight QuickFixLine guibg=#707070 guifg=#e8d8c5

" ########################################################################
" ######## Native LSP and associated Plugins and Settings
" ########################################################################
let g:completion_enable_auto_popup=1

lua <<EOF
require'nvim_lsp'.tsserver.setup {
    on_attach=require'completion'.on_attach,
    on_attach=require'diagnostic'.on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
EOF

lua vim.lsp.set_log_level(4)

" nmap <silent> <Leader>ee <Plug>(coc-refactor)

set completeopt=longest,menuone,noinsert,noselect,noinsert
set shortmess+=c

inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)


nnoremap <silent> <Leader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>td    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <Leader>fr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>s     <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <Leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>ac    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>gg    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <Leader>s     <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> tt            <cmd>lua vim.lsp.buf.document_symbol()<CR>


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
let g:diagnostic_enable_underline = 0
