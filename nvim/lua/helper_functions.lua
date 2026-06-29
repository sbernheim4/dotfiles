---@diagnostic disable: unused-local

-- Helper function to set a normal mode key mapping.
-- Automatically sets noremap and silent to true.
local set_normal_keymap = function(keymap, command)
	vim.api.nvim_set_keymap(
		'n',
		keymap,
		command,
		{ noremap = true, silent = true }
	);
end

-- Determines if the quick fix window is open;
local is_qf_window_open = function(window_name)

	for _, win in pairs(vim.fn.getwininfo()) do
		if win[window_name] == 1 then
			return true
		end
	end

	return false;

end

-- Toggles the quickfix and puts in at the bottom of all open windows.
function toggle_quick_fix()

	-- Keep track of the window where your cursor was before opening the
	-- quickfix window.
	old_window = current_window or vim.fn.win_getid();
	current_window = vim.fn.win_getid();

	if (is_qf_window_open("quickfix")) then
		vim.api.nvim_set_current_win(old_window)
		vim.cmd('cclose')
	else
		vim.cmd('copen');
		vim.api.nvim_command('wincmd J');
		vim.cmd('resize 10')
	end

end

set_normal_keymap('cm', ':lua toggle_quick_fix()<CR>');
