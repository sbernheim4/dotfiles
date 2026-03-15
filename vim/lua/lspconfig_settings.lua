-- lua/lspconfig_settings.lua

-- LSP keymaps when server attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
})

-- LSP servers
vim.lsp.config("gopls", {})

vim.lsp.config("pyright", {})

vim.lsp.config("eslint", {})

vim.lsp.config("jsonls", {})

vim.lsp.config("yamlls", {})

vim.lsp.config("bashls", {})

vim.lsp.config("cssls", {})

vim.lsp.config("vimls", {})

vim.lsp.config("graphql", {})

vim.lsp.config("intelephense", {})

-- Enable them
vim.lsp.enable({
  "gopls",
  "pyright",
  "eslint",
  "jsonls",
  "yamlls",
  "bashls",
  "cssls",
  "vimls",
  "graphql",
  "intelephense",
})
