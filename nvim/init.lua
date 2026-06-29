vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function() vim.cmd('wincmd L') end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  command = 'setlocal spell',
})

vim.cmd([[syntax enable]])
vim.opt.termguicolors = true
vim.opt.background = 'dark'

local config_dir = vim.fn.fnamemodify(
  vim.fn.resolve(debug.getinfo(1, 'S').source:sub(2)),
  ':h'
)
package.path = config_dir .. '/lua/?.lua;' .. package.path

-- Keep legacy Vim plugin settings grouped until their plugins are migrated to Lua.
for _, filename in ipairs({ 'ale.vim', 'argwrap.vim', 'sideways.vim', 'signify.vim' }) do
  vim.cmd('source ' .. vim.fn.fnameescape(config_dir .. '/vim-plugins/' .. filename))
end

require('lazy_config')
require('lsp_signature_settings')
require('lspconfig_settings')
require('nvim_tree_settings')
require('lspfuzzy_settings')
require('navic_settings')
require('cmp_settings')
require('symbols_outline_settings')
require('telescope_settings')
require('helper_functions')
require('dashboard_settings')
require('mappings')
require('dap_config')
require('highlights')
require('settings')
require('status_line').setup()

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
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
