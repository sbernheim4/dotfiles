require('telescope').setup {
	defaults = {
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				preview_width = .6,
				width = 0.8
			}
			-- other layout configuration here
		},
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
			}
		}
	},
	pickers = {
		-- Decault configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}


-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', 'ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'aa', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tt', '<cmd>Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })
