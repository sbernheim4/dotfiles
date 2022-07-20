local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false
			}
		}
	},
	git = {
		enable = true,
		ignore = false,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = "I", action = "toggle_dotfiles" },
				{ key = "H", action = "toggle_git_ignored" },
				{ key = "s", action = "vsplit" },
				{ key = "S", action = "split" }
			}
		}
	}

})

-- vim.api.nvim_set_keymap('n', '<Leader>d', ':NvimTreeToggle<CR>',   { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>nf',':NvimTreeFindFile<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>nt',':NvimTreeRefresh<CR>',  { noremap = true, silent = true })
