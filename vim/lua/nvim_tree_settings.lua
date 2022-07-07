local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	view = {
		mappings = {
			custom_only = false,
			list = {
    			{ key = "I",  action = "toggle_dotfiles" },
    			{ key = "H",  action = "toggle_git_ignored" }
			}
		}
	}

})

-- vim.api.nvim_set_keymap('n', '<Leader>d', ':NvimTreeToggle<CR>',   { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>nf',':NvimTreeFindFile<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>nt',':NvimTreeRefresh<CR>',  { noremap = true, silent = true })
