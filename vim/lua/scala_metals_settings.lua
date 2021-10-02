local cmd = vim.cmd
local g = vim.g
local capabilities = vim.lsp.protocol.make_client_capabilities()

metals_config = require("metals").bare_config

cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])

vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])


metals_config.settings = {
    showImplicitArguments = true,
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

metals_config.capabilities = capabilities
