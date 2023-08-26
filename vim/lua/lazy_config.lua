local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
	-- Packer can manage itself

	{ "folke/neodev.nvim" },

	-- Misc.
	{ "alexghergh/nvim-tmux-navigation" },
	{ 'hardcoreplayers/dashboard-nvim' },
	{ 'ap/vim-buftabline' },

	-- Feature Enhancers
	{ 'kyazdani42/nvim-tree.lua' },
	{ 'sbernheim4/vim-ripgrep' },
	{ 'mhinz/vim-signify' },
	{ 'ruanyl/vim-gh-line' },
	{ 'rhysd/git-messenger.vim' },

	-- Text Manipulation
	{ 'Raimondi/delimitMate' },
	{ 'tpope/vim-surround' },
	{ 'AndrewRadev/sideways.vim' },
	{ 'FooSoft/vim-argwrap' },

	-- FZF
	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf', build = ':call fzf#install()' }
	},

	-- Syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'nvim-treesitter/playground' },
	{ 'nvim-treesitter/nvim-treesitter-context' },
	{
		'gruvbox-community/gruvbox',
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end
	},

	-- LSP
	{ 'williamboman/nvim-lsp-installer' },
	{ 'neovim/nvim-lspconfig' },
	{ 'SmiteshP/nvim-navic' },
	{ 'nvim-lua/popup.nvim' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'ojroques/nvim-lspfuzzy' },
	{ 'ray-x/lsp_signature.nvim' },

	-- Snippets and Completion
	{ 'hrsh7th/nvim-cmp' },

	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/vim-vsnip' },
	{ 'hrsh7th/vim-vsnip-integ' },

	{ 'simrat39/symbols-outline.nvim' },

	-- For linting/formatting via ESLint and Prettier
	{ 'dense-analysis/ale' },
	{ 'nvim-tree/nvim-web-devicons' },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				filetypes = {
					lua = true,
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					["."] = false,
				},
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end
	},
})
