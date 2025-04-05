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
	-- { 'nvim-treesitter/nvim-treesitter-context' },
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
	{ 'ojroques/nvim-lspfuzzy' },
	{ 'ray-x/lsp_signature.nvim' },

	-- Snippets and Completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/vim-vsnip' },
			{ 'hrsh7th/vim-vsnip-integ' },
		}
	},

	-- DAP
	{ "williamboman/mason.nvim" },
	{ "mfussenegger/nvim-dap",  lazy = true, },
	{
		"jay-babu/mason-nvim-dap.nvim",
		---@type MasonNvimDapSettings
		opts = {
			-- This line is essential to making automatic installation work
			-- :exploding-brain
			handlers = {},
			automatic_installation = {
				-- These will be configured by separate plugins.
				exclude = {
					"delve",
					"python",
				},
			},
			-- DAP servers: Mason will be invoked to install these if necessary.
			ensure_installed = {
				"bash",
				"codelldb",
				"php",
				"python",
			},
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = true,
		dependencies = { "mfussenegger/nvim-dap", }
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap"
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		config = true,
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text"
		}
	},


	-----------------------------------------------------------------------------------

	{ 'simrat39/symbols-outline.nvim' },

	-- For linting/formatting via ESLint and Prettier
	{ 'dense-analysis/ale' },
	{ 'nvim-tree/nvim-web-devicons' },

	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
		}
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

})
