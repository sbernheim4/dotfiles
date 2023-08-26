vim.cmd.packadd('packer.nvim')

return require('packer').startup(
	function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- Misc.
		use { 'christoomey/vim-tmux-navigator' }
		use { 'hardcoreplayers/dashboard-nvim' }
		use { 'ap/vim-buftabline' }

		-- Feature Enhancers
		use { 'kyazdani42/nvim-tree.lua' }
		use { 'sbernheim4/vim-ripgrep' }
		use { 'mhinz/vim-signify' }
		use { 'ruanyl/vim-gh-line' }
		use { 'rhysd/git-messenger.vim' }

		-- Text Manipulation
		use { 'Raimondi/delimitMate' }
		use { 'tpope/vim-surround' }
		use { 'AndrewRadev/sideways.vim' }
		use { 'FooSoft/vim-argwrap' }

		-- FZF
		 use {
			 'junegunn/fzf.vim',
			 requires = { 'junegunn/fzf', run = ':call fzf#install()' }
		 }

		-- Syntax highlighting
		use { 'nvim-treesitter/nvim-treesitter' }
		use { 'nvim-treesitter/playground' }
		use { 'nvim-treesitter/nvim-treesitter-context' }
		use { 'gruvbox-community/gruvbox' }

		-- LSP
		use { 'williamboman/nvim-lsp-installer' }
		use { 'neovim/nvim-lspconfig' }
		use { 'SmiteshP/nvim-navic' }
		use { 'nvim-lua/popup.nvim' }
		use { 'nvim-lua/plenary.nvim' }
		use { 'ojroques/nvim-lspfuzzy' }
		use { 'ray-x/lsp_signature.nvim' }

		-- Snippets and Completion
		use { 'hrsh7th/nvim-cmp' }

		use { 'hrsh7th/cmp-nvim-lsp' }
		use { 'hrsh7th/cmp-buffer' }
		use { 'hrsh7th/cmp-nvim-lua' }
		use { 'hrsh7th/vim-vsnip' }
		use { 'hrsh7th/vim-vsnip-integ' }

		use { 'simrat39/symbols-outline.nvim' }

		-- For linting/formatting via ESLint and Prettier
		use { 'dense-analysis/ale' }
		use { 'nvim-tree/nvim-web-devicons' }

		use {
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
		}

		use {
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end
		}
	end
)
