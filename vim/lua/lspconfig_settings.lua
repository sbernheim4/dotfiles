local lspconfig = require 'lspconfig'
local cmp = require 'cmp_nvim_lsp'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local completion_capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup    { capabilities = capabilities }
lspconfig.tsserver.setup { capabilities = completion_capabilities }
lspconfig.vimls.setup    { capabilities = completion_capabilities }
lspconfig.metals.setup   { capabilities = completion_capabilities }
lspconfig.bashls.setup   { capabilities = completion_capabilities }
lspconfig.graphql.setup  { capabilities = completion_capabilities }
lspconfig.vimls.setup    { capabilities = completion_capabilities }
lspconfig.yamlls.setup   {
    capabilities = completion_capabilities,
    schemaStore = { url = "https://www.schemastore.org/api/json/catalog.json" }
}

-- Lua LSP Setup
-- Install Help:
-- Clone the relevant git repo in ~/personal
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local system_name = "macOS"
local sumneko_root_path = "/Users/sambernheim/personal/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin".."/lua-language-server"
local runtime_path = vim.split(package.path, ';')

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    }
  }
}
