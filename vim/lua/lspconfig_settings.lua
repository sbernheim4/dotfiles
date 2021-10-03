local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup {}
lspconfig.vimls.setup {}
lspconfig.metals.setup {}
lspconfig.bashls.setup {}
lspconfig.cssls.setup {
    capabilities = capabilities
}
lspconfig.graphql.setup {}
lspconfig.vimls.setup {}
lspconfig.yamlls.setup{}
