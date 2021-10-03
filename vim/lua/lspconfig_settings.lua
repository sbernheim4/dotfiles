local lspconfig = require 'lspconfig'
local cmp = require 'cmp_nvim_lsp'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
completion_capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup { capabilities = completion_capabilities }
lspconfig.vimls.setup { capabilities = completion_capabilities }
lspconfig.metals.setup { capabilities = completion_capabilities }
lspconfig.bashls.setup { capabilities = completion_capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.graphql.setup { capabilities = completion_capabilities }
lspconfig.vimls.setup { capabilities = completion_capabilities }
lspconfig.yamlls.setup{ capabilities = completion_capabilities }
