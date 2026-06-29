-- lua/lspconfig_settings.lua

local util = require('lspconfig.util')

local function project_root(fname)
  return util.root_pattern('pyproject.toml', 'setup.py', '.git')(fname)
end

local function python_venv_env(root_dir)
  if not root_dir then
    return nil
  end

  local venv = root_dir .. '/.venv'
  local bin = venv .. '/bin'
  if vim.fn.executable(bin .. '/python') == 1 then
    return {
      VIRTUAL_ENV = venv,
      PATH = bin .. ':' .. vim.env.PATH,
    }
  end

  return nil
end

-- LSP keymaps when server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, opts)

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
})

vim.lsp.config('gopls', {})
vim.lsp.config('eslint', {})
vim.lsp.config('jsonls', {})
vim.lsp.config('yamlls', {})
vim.lsp.config('bashls', {})
vim.lsp.config('cssls', {})
vim.lsp.config('vimls', {})
vim.lsp.config('graphql', {})
vim.lsp.config('intelephense', {})

vim.lsp.config('ty', {
  cmd = { 'uv', 'run', 'ty', 'server' },
  filetypes = { 'python' },
  root_dir = project_root,
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
  on_new_config = function(new_config, root_dir)
    local env = python_venv_env(root_dir)
    if env then
      new_config.cmd_env = env
    end
  end,
})

vim.lsp.config('pyrefly', {
  cmd = { 'uv', 'run', 'pyrefly', 'lsp' },
  filetypes = { 'python' },
  root_dir = project_root,
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
  on_new_config = function(new_config, root_dir)
    local env = python_venv_env(root_dir)
    if env then
      new_config.cmd_env = env
    end
  end,
})

vim.lsp.enable({
  'gopls',
  'eslint',
  'jsonls',
  'yamlls',
  'bashls',
  'cssls',
  'vimls',
  'graphql',
  'intelephense',
  'ty',
  'pyrefly',
})
