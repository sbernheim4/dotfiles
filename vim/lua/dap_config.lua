-- lua/keymaps/dap.lua

local dap = require("dap")
local dap_go = require("dap-go")
local dapui = require("dapui")
local mason = require("mason")
local mason_nvim_dap = require("mason-nvim-dap")

mason.setup()

mason_nvim_dap.setup({})
dapui.setup()
dap_go.setup()

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to Cursor" })
vim.keymap.set("n", "<leader>dT", dap.terminate, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dt", dap_go.debug_test, { desc = "Debug Test" })
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })


dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug Go Server",
		request = "launch",
		program = "${workspaceFolder}/main.go",
		mode = "debug"
	},
	{
		type = "go",
		name = "Attach to Go server",
		request = "attach",
		substitutePath = {
			{
				from = "/Users/samuelbernheim/notification-service/go-server",
				to = "/code",
			},
		},
		mode = "remote",
		port = 2345,
		host = "127.0.0.1"
	},
}

dap.configurations.node2 = {
	type = 'server',
	host = '127.0.0.1',
	port = 9229,
}

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
	}
}

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

dap.configurations.javascript = {
	{
		name = 'Launch Node.js',
		type = 'node2',                    -- Must match the adapter name
		request = 'launch',
		program = '${workspaceFolder}/index.js', -- Replace with the entry point of your Node.js app
		cwd = '${workspaceFolder}',
		runtimeExecutable = 'node',
		runtimeArgs = { '--inspect-brk=9229' }, -- Tells Node.js to start in debugging mode
		sourceMaps = true,
		skipFiles = { '<node_internals>/**' }
	}
}

dap.configurations.typescript = {
	{
		name = 'Launch Node.js',
		type = 'node2',
		request = 'launch',
		program = '${workspaceFolder}/index.ts', -- For TypeScript, you can also configure this
		cwd = '${workspaceFolder}',
		runtimeExecutable = 'node',
		runtimeArgs = { '--inspect-brk=9229', '--require', 'ts-node/register' }, -- Use ts-node for TypeScript
		sourceMaps = true,
		skipFiles = { '<node_internals>/**' }
	}
}
