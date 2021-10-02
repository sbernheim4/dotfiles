local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup {}
lspconfig.vimls.setup {}
lspconfig.metals.setup {}
lspconfig.cssls.setup {
    capabilities = capabilities
}


