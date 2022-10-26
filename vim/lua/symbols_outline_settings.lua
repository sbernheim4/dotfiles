local symbols_outline = require("symbols-outline")

local opts = {
	auto_close = false,
	auto_preview = false,
	autofold_depth = 2,
	highlight_hovered_item = false,
	keymaps = {
		close = { "<Esc>", "q" },
		code_actions = "a",
		focus_location = "o",
		fold = "h",
		fold_all = "W",
		fold_reset = "R",
		goto_location = "<Cr>",
		hover_symbol = "<C-space>",
		rename_symbol = "r",
		toggle_preview = "K",
		unfold = "l",
		unfold_all = "E"
	},
	lsp_blacklist = {},
	position = 'right',
	preview_bg_highlight = 'Pmenu',
	relative_width = true,
	show_guides = true,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSMethod" },
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "𝓐", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" }
	},
	width = 25
}

symbols_outline.setup(opts)

vim.api.nvim_set_keymap('n', '<Leader>a', ':SymbolsOutline<CR>', { noremap = true, silent = true })
