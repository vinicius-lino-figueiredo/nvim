local toggleterm = require("toggleterm")

local open_mapping = [[<C-]>]]
if vim.loop.os_uname().sysname == "Windows_NT" then
	open_mapping = [[<C-\>]]
end

toggleterm.setup({
	open_mapping = open_mapping,
	direction = "float",
	shade_terminals = true,
	persist_mode = false,
})

local Terminal = require("toggleterm.terminal").Terminal

function _G.get_tab_terminal()
	local tab_id = vim.api.nvim_get_current_tabpage()
	local term = Terminal:new({
		count = tab_id,
		direction = "float",
		on_open = function(term)
			vim.cmd("startinsert!")
		end,
	})
	return term
end

function _G.toggle_tab_terminal()
	local term = get_tab_terminal()
	term:toggle()
end

vim.api.nvim_set_keymap("n", "<C-]>", "<cmd>lua toggle_tab_terminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-]>", "<cmd>lua toggle_tab_terminal()<CR>", { noremap = true, silent = true })
