local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	layouts = {
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			["close"] = { "q", "<Esc>" },
		},
	},
	controls = {
		enabled = vim.fn.exists("+winbar") == 1,
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "",
			terminate = "",
			disconnect = "",
		},
	},
	render = {
		max_type_length = nil,
		max_value_lines = 100,
		indent = 1,
	},
})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

function toggle_floating_scopes()
	local d = require("dapui")
	local s, r
	for _, w in ipairs(vim.api.nvim_list_wins()) do
		local f = vim.bo[vim.api.nvim_win_get_buf(w)].filetype
		if f == "dapui_scopes" then
			s = w
			break
		end
	end
	local W, H = math.floor(vim.o.columns * 0.6), math.floor(vim.o.lines * 0.6)
	if s and vim.api.nvim_win_is_valid(s) then
		vim.api.nvim_win_close(s, true)
	else
		if r and vim.api.nvim_win_is_valid(r) then
			vim.api.nvim_win_close(r, true)
		end
		d.float_element("scopes", { width = W, height = H, enter = true, position = "center" })
	end
end

vim.keymap.set("n", "<F6>", toggle_floating_scopes, { noremap = true, silent = true })

local adapters = require("config.adapters")
for n, v in pairs(adapters.adapters) do
	dap.adapters[n] = v
end
for n, v in pairs(adapters.configs) do
	dap.configurations[n] = v
end

-- Include the next few lines until the comment only if you feel you need it
-- dap.listeners.before.event_terminated.dapui_config = function()
--  dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--  dapui.close()
-- end
-- Include everything after this

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>q", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>Q", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set("n", "<Leader>X", function()
	require("dap").terminate()
end)
vim.keymap.set("n", "<Leader>w", ":DapUiToggle<CR>")
