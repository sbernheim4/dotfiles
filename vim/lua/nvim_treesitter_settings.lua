local nvim_treesitter_configs = require 'nvim-treesitter.configs'

nvim_treesitter_configs.setup({
  highlight = { enable = true },
  ensure_installed = {"javascript", "typescript"},
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    navigation = { enable = false, }
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25,
    persist_queries = false
  }
})

