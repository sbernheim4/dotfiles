-- ########################################################################
-- Global Options
-- ########################################################################

local opt = vim.opt
local cmd = vim.cmd

-- UI Settings
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.encoding = 'utf-8'
opt.backspace = { 'indent', 'eol', 'start' }
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 4
opt.autowrite = true
opt.signcolumn = 'yes'
opt.smartindent = true
opt.timeoutlen = 200
opt.mouse = ''

-- Line Wrapping
opt.wrap = false
opt.breakindent = true
opt.linebreak = true
opt.breakindentopt = 'shift:3,sbr'
opt.textwidth = 80
opt.colorcolumn = ''

-- Backup and Swap
opt.backup = false
opt.swapfile = false
opt.undofile = false

-- Tabs and Spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.inccommand = 'split'

if vim.fn.executable('rg') == 1 then
	opt.grepprg = 'rg --vimgrep --no-heading'
	opt.grepformat = { '%f:%l:%c:%m', '%f:%l:%m' }
end

-- Undo
opt.undodir = vim.fn.expand('~/.vim/undo-dir')

-- List Characters
opt.list = true
opt.listchars = { tab = '• ', eol = '¬' }
opt.fillchars:append('vert:█')

-- Statusline
opt.laststatus = 3
opt.showmode = false

-- Folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
opt.foldcolumn = '0'
opt.foldlevelstart = 99

-- Completion
opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
opt.shortmess:append('c')
opt.shortmess:remove('F')

-- ########################################################################
-- Fold Text Customization
-- ########################################################################

local function get_spaces(foldlevel)
	if vim.o.expandtab then
		return string.rep(" ", foldlevel / (vim.o.shiftwidth + 1) - 1)
	else
		return string.rep(" ", vim.fn.indent(vim.v.foldstart) - (vim.fn.indent(vim.v.foldstart) / vim.o.shiftwidth))
	end
end

function _G.MyFoldText()
	local start_line = vim.fn.getline(vim.v.foldstart)
	local end_line = vim.trim(vim.fn.getline(vim.v.foldend))
	local indentation = get_spaces(vim.fn.foldlevel('.'))
	local spaces = string.rep(" ", 1000)
	return indentation .. start_line .. '  ..  ' .. end_line .. spaces
end

-- ########################################################################
-- Resize Splits Automatically Based on Filetype
-- ########################################################################

local blacklist = { NvimTree = true, Outline = true, qf = true, dashboard = true }

function _G.ResizeSplits()
	local ft = vim.bo.filetype

	if ft == 'NvimTree' then
		cmd('vertical resize 30')
		vim.wo.relativenumber = false
		vim.wo.signcolumn = 'yes'
	elseif ft == 'Outline' or ft == 'dashboard' then
		vim.wo.relativenumber = false
	elseif ft == 'qf' then
		cmd('resize 10')
	else
		vim.o.winwidth = 100
		cmd('wincmd =')
	end
end

-- ########################################################################
-- ReduceNoise Autocmds
-- ########################################################################

vim.api.nvim_create_augroup("ReduceNoise", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
	group = "ReduceNoise",
	callback = function()
		local ft = vim.bo.filetype
		if not blacklist[ft] then
			vim.wo.signcolumn = "auto"
			vim.wo.relativenumber = true
		end
		vim.wo.cursorline = true
		_G.ResizeSplits()
	end
})

vim.api.nvim_create_autocmd("WinLeave", {
	group = "ReduceNoise",
	callback = function()
		local ft = vim.bo.filetype
		if not blacklist[ft] then
			vim.wo.signcolumn = "no"
			vim.wo.relativenumber = false
		end
		vim.wo.cursorline = false
	end
})
