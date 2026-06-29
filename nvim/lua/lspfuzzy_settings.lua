local lspfuzzy = require 'lspfuzzy'

lspfuzzy.setup({
	methods = {
		'textDocument/documentSymbol',
		-- 'textDocument/references'
	}
})
