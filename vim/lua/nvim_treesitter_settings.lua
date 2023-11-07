local nvim_treesitter_configs = require 'nvim-treesitter.configs'

nvim_treesitter_configs.setup({
	indent = { enable = true },
	highlight = { enable = true },
	ensure_installed = {
		"javascript",
		"typescript",
		"vimdoc",
		"html",
		"bash",
		"gitcommit",
		"markdown",
		"rust",
		"scala",
	},
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
