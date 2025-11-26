local dap, dapui = require("dap"), require("dapui")

---@diagnostic disable-next-line:missing-fields
dapui.setup({
	layouts = {
		{
			elements = {
				"repl",
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

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open

local function toggle_floating_scopes()
	local s, r
	for _, w in ipairs(vim.api.nvim_list_wins()) do
		local f = vim.bo[vim.api.nvim_win_get_buf(w)].filetype
		if f == "dapui_scopes" then
			s = w
			break
		end
	end

	local w = math.floor(vim.o.columns * 0.6)
	local h = math.floor(vim.o.lines * 0.6)

	if s and vim.api.nvim_win_is_valid(s) then
		vim.api.nvim_win_close(s, true)
		return
	end

	if r and vim.api.nvim_win_is_valid(r) then
		vim.api.nvim_win_close(r, true)
	end
	dapui.float_element("scopes", {
		title = "Scopes",
		width = w,
		height = h,
		enter = true,
		position = "center",
	})
end

vim.keymap.set("n", "<F6>", toggle_floating_scopes, { noremap = true, silent = true })

local adapters = require("config.adapters")
for n, v in pairs(adapters.adapters) do
	dap.adapters[n] = v
end
for n, v in pairs(adapters.configs) do
	dap.configurations[n] = v
end

vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F12>", ":DapStepOut<CR>")
vim.keymap.set("n", "<Leader>q", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>Q", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", ":ReplTogle")
vim.keymap.set("n", "<Leader>dl", ":DapRunkast<CR>")
vim.keymap.set("n", "<Leader>X", ":DapTerminate<CR>")
vim.keymap.set("n", "<Leader>w", ":DapUiToggle<CR>")

dap.listeners.after.event_stopped["notify_others"] = function(_, body)
	if body.reason ~= "breakpoint" then
		return
	end
	vim.schedule(function()
		vim.fn.jobstart({
			"nvim-ctrl",
			string.format(
				'lua if %s ~= vim.fn.getpid() then require("notify")("Debug stopped at breakpoint on pid %s", vim.log.levels.INFO, {title="Breakpoint"}) end',
				vim.fn.getpid(),
				vim.fn.getpid()
			),
		}, { detach = true })
	end)
end
