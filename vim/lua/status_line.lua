local M = {}

-- Set default options
M.options = {
	left_sep = "",
	right_sep = "",
}

-- Function to get the mode
local function GetMode()
	local mode = vim.fn.mode()
	if mode == 'n' then
		return 'NORMAL'
	elseif mode == 'i' then
		return 'INSERT'
	elseif mode == 'v' then
		return 'VISUAL'
	elseif mode == 'c' then
		return 'COMMAND'
	else
		return '¯\\_(ツ)_/¯'
	end
end

-- Function to check if the file is modified
local function CheckMod(modified)
	if modified == 1 then
		return vim.fn.expand('%:t') .. '•'
	else
		return vim.fn.expand('%:t')
	end
end

-- Highlight groups
local function set_highlights()
	local highlights = {
		User1 = { ctermbg = 237, ctermfg = 214, guibg = '#424242', guifg = '#ffaf00' },
		User2 = { ctermbg = 232, ctermfg = 237, guibg = '#1c1c1c', guifg = '#424242' },
		User3 = { ctermbg = 232, ctermfg = 222, guibg = '#1c1c1c', guifg = '#ebdbb2' },
		User4 = { ctermbg = 4, ctermfg = 232, guibg = '#458588', guifg = '#1c1c1c' },
		User5 = { ctermbg = 235, ctermfg = 4, guibg = '#282828', guifg = '#458588' },
		User6 = { ctermbg = 4, ctermfg = 232, guibg = '#458588', guifg = '#1c1c1c' },
		User7 = { ctermbg = 236, ctermfg = 222, guibg = '#404040', guifg = '#ebdbb2' },
		User8 = { ctermbg = 4, ctermfg = 236, guibg = '#458588', guifg = '#404040' },
		User9 = { ctermbg = 232, ctermfg = 4, guibg = '#1c1c1c', guifg = '#458588' },
	}

	for group, colors in pairs(highlights) do
		-- Check if the user is in a GUI environment (e.g., Neovide)
		local hl_settings = {}

		if vim.fn.has('gui_running') == 1 then
			-- If in GUI, apply both gui and cterm settings
			hl_settings.guibg = colors.guibg
			hl_settings.guifg = colors.guifg
		end

		hl_settings.ctermbg = colors.ctermbg
		hl_settings.ctermfg = colors.ctermfg

		vim.api.nvim_set_hl(0, group, hl_settings)
	end
end

-- Active status line
local function ActiveLine()
	local statusline = ""
	statusline = statusline .. "%1*"
	statusline = statusline .. " " .. GetMode() .. " "
	statusline = statusline .. "%2*"
	statusline = statusline .. M.options.left_sep
	statusline = statusline .. "%4*"
	statusline = statusline .. M.options.left_sep
	statusline = statusline .. " " .. CheckMod(vim.bo.modified) .. " "
	statusline = statusline .. "%5*"
	statusline = statusline .. M.options.left_sep
	statusline = statusline .. "%="
	statusline = statusline .. " "
	statusline = statusline .. "%6*"
	statusline = statusline ..
		" Ln " .. vim.fn.line('.') .. " (" .. math.floor((vim.fn.line('.') / vim.fn.line('$')) * 100) .. "%%)"
	statusline = statusline .. "%8*"
	statusline = statusline .. " " .. M.options.left_sep
	statusline = statusline .. "%7*"
	statusline = statusline .. " Col: %-3c"

	return statusline
end

-- Inactive status line
local function InactiveLine()
	local statusline = ""
	if vim.fn.has('nvim') == 1 then
		statusline = statusline .. "%2*"
	end
	statusline = statusline .. " " .. CheckMod(vim.bo.modified) .. " "
	return statusline
end

-- Automatically change statusline when switching between buffers and windows
local function set_autocmds()
	vim.api.nvim_create_augroup("Statusline", { clear = true })

	-- Set statusline when entering or leaving a window/buffer
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		group = "Statusline",
		callback = function()
			vim.wo.statusline = "%!v:lua.require('status_line').ActiveLine()"
		end,
	})

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		group = "Statusline",
		callback = function()
			vim.wo.statusline = "%!v:lua.require('status_line').InactiveLine()"
		end,
	})
end

-- Setup function
function M.setup(opts)
	-- Merge user options with defaults
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})

	-- Set highlights
	set_highlights()

	-- Set the initial status line
	vim.wo.statusline = "%!v:lua.require('status_line').ActiveLine()"

	-- Set autocmds
	set_autocmds()
end

-- Expose the functions
M.ActiveLine = ActiveLine
M.InactiveLine = InactiveLine

return M
