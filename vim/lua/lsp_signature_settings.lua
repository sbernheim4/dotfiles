local lsp_signature = require('lsp_signature')

lsp_signature.setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = 'single'
	},
	padding = ' ',
	hint_prefix = "",
	hint_enable = false,
	floating_window_above_cur_line = true,
})
